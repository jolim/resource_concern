module ResourceConcern
  extend ActiveSupport::Concern

  included do
    before_action :get_resource, only: [:destroy, :edit, :show, :update]
  end

  def get_resource
    @resource = resource_class.find(params[:id])
    instance_variable_set "@#{resource_name}", @resource
  end

  private

  def resource_class
    @resource_class ||=
      self.class.to_s.gsub(/Controller/, '').gsub(/.*::/, '').singularize.constantize
  end

  def resource_name
    resource_class.name.underscore
  end
end
