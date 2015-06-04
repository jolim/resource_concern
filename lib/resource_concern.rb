module ResourceConcern
  extend ActiveSupport::Concern

  included do
    before_action :get_resource, only: [:destroy, :edit, :show, :update]
  end

  def get_resource
    set_resource_name
    if !@resource_class.constantize.exists?(params[:id])
      raise ActionController::RecordNotFound.new('Not Found')
    end

    eval "@#{@resource_name} = #{@resource_class}.find params[:id]"
    eval "@resource = @#{@resource_name}"
  end
  
private

  def set_resource_name
    @resource_class = self.class.to_s.gsub(/Controller/,'').gsub(/.*::/,'').singularize
    @resource_name = @resource_class.underscore   
  end

end

require 'ownable_concern'