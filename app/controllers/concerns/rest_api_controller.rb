module RestApiController
  extend ActiveSupport::Concern

  included do
    before_action :resource, except: %i[index create admins]
    before_action :require_resource_params, only: %i[create update]

    def index
      @resources = (respond_to? :index_callback) ? index_callback : resource_class.all
      render json: @resources, status: :ok
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
    def resource_class
      controller_path.classify.delete_prefix('Api::').delete_suffix('Controller').constantize
    end

    def resource
      @resource = resource_class.find_by_id!(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end

    def require_resource_params
      @params = params.require(resource_class.to_s.downcase.to_sym).permit(@permited_params)
    end
  end
end
