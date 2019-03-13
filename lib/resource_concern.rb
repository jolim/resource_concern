# frozen_string_literal: true

module ResourceConcern
  extend ActiveSupport::Concern

  included do
    before_action :get_resource, only: %i[destroy edit show update]
  end

  class_methods do
    def acts_as_resourceful(klass:)
      define_method :rc_resource_klass do
        klass
      end
    end
  end

  def get_resource
    @resource = rc_resource_klass.find(params[:id])
    instance_variable_set "@#{rc_resource_name}", @resource
  end

  alias resource get_resource

  private

  def rc_resource_klass
    @rc_resource_klass ||=
      self.class.to_s.gsub(/Controller/, '').gsub(/.*::/, '').singularize.constantize
  end

  def rc_resource_name
    rc_resource_klass.name.gsub('::', '_').underscore
  end
end
