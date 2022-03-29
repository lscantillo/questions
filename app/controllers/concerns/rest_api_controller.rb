module RestApiController
  extend ActiveSupport::Concern
  include Pagy::Backend
  included do
    before_action :resource, except: %i[index create admins upvote downvote]
    before_action :require_resource_params, only: %i[create update]
    before_action :authorize_request

    def index
      @resources = (respond_to? :index_callback) ? index_callback : resource_class.all
      @serializer ||= "#{resource_class}Serializer".constantize
      if params[:items].nil? && params[:page].nil?
        render json: {
          data: serialize(@resources, @serializer)[resource_class.to_s.pluralize.downcase.to_sym]
        }, status: :ok
      else
        params[:items] ||= Pagy::DEFAULT[:items]
        params[:page] ||= Pagy::DEFAULT[:page]
        @pagy, @resources = pagy(@resources, items: params[:items])
        render json: {
          data: serialize(@resources, @serializer)[resource_class.to_s.pluralize.downcase.to_sym],
          pagy: pagy_metadata(@pagy)
        }, status: :ok
      end
    end

    def show
      show_callback if respond_to? :show_callback
      @serializer ||= "#{resource_class}Serializer".constantize
      render json: serialize(@resource, @serializer)[resource_class.to_s.downcase.to_sym], status: :ok
    end

    def create
      @resource = resource_class.create(@params)
      create_callback if respond_to? :create_callback
      @serializer ||= "#{resource_class}Serializer".constantize
      if @resource.saved_changes?
        render json: serialize(@resource, @serializer)[resource_class.to_s.downcase.to_sym], status: :ok
      else
        render :json, status: :conflict
      end
    end

    def update
      @resource.update(@params)
      update_callback if respond_to? :update_callback
      if @resource.saved_changes?
        render json: serialize(@resource, @serializer)[resource_class.to_s.downcase.to_sym], status: :ok
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

    def serialize(resource, serializer)
      if resource.is_a? Enumerable
        ActiveModelSerializers::SerializableResource.new(
          resource,
          each_serializer: serializer
        ).as_json
      else
        ActiveModelSerializers::SerializableResource.new(
          resource,
          serializer: serializer
        ).as_json
      end
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
      @params = params.permit(permited_params)
    end
  end
end
