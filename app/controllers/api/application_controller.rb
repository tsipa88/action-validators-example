module Api
  class ApplicationController < ActionController::Base
    layout false
    respond_to :json
    skip_before_action :verify_authenticity_token
  end
end
