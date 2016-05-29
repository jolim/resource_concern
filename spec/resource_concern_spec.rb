require 'rails_helper'

class ControllerWithResourceControllerConcern < ActionController::Base
  include ResourceConcern
end

RSpec.describe ResourceConcern, type: :module do

end
