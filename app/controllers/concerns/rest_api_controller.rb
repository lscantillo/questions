module RestApiController
  extend ActiveSupport::Concern
  include Pagy::Backend
  included do
    before_action :resource, except: %i[index create admins]
    before_action :require_resource_params, only: %i[create update]

    def index
      @resources = (respond_to? :index_callback) ? index_callback : resource_class.all
      if params[:items].nil?
        render json: @resources, status: :ok
      else
        @pagy, @resources = pagy(@resources, items: params[:items])
        serializer_name = "#{resource_class.name}Serializer".constantize
        data = ActiveModel::Serializer::CollectionSerializer.new(@resources, serializer: serializer_name).as_json
        render json:{data: data ,pagy: pagy_metadata(@pagy)}
      end
    end

    def show
      show_callback if respond_to? :show_callback
      render json: @resource, status: :ok
    end

    def create
      @resource = resource_class.create(@params)
      create_callback if respond_to? :create_callback
      if @resource.saved_changes?
        render json: @resource, status: :ok
      else
        render :json, status: :conflict
      end
    end

    def update
      @resource.update(@params)
      update_callback if respond_to? :update_callback
      if @resource.saved_changes?
        render json: @resource, status: :ok
      else
        render json: { message: 'Nothing has changed' }, status: :conflict
      end
    end

    def destroy
      @resource.destroy
      destroy_callback if respond_to? :destroy_callback
      if @resource.destroyed?
        render :json, status: :ok
      else
        render :json, status: :internal_server_error
      end
    end

    private

    def serialize(collection, serializer)
      ActiveModelSerializers::SerializableResource.new(
        collection,
        each_serializer: serializer,
      ).as_json
    end

    def resource_class
      controller_path.classify.delete_prefix('Api::').delete_suffix('Controller').constantize
    end

    def resource
      @resource = resource_class.find_by_id!(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end

    def require_resource_params
      @params = params.require(resource_class.to_s.downcase.to_sym).permit(permited_params)
    end
  end
end
