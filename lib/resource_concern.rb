module ResourceConcern
  extend ActiveSupport::Concern

  included do
    before_action :get_resource, only: [:destroy, :edit, :show, :update]
  end

  def get_resource
    @resource = rc_resource_klass.find(params[:id])
    instance_variable_set "@#{rc_resource_name}", @resource
  end

  private

  def rc_resource_klass
    @rc_resource_klass ||=
      self.class.to_s.gsub(/Controller/, '').gsub(/.*::/, '').singularize.constantize
  end

  def rc_resource_name
    rc_resource_klass.name.underscore
  end
end
