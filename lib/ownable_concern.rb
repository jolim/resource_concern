module Concerns::OwnableConcern
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!, only: [:create, :edit, :destroy, :update]
    before_action :current_user_must_be_creator, only: [:edit, :destroy, :update]
  end

  def current_user_must_be_creator
    raise ActionController::RoutingError.new('You do not own this resource. Permission denied.')
  end
end