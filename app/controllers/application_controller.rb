class ApplicationController < ActionController::API
  include Knock::Authenticable

  def return_unauthorized
    render status: :unauthorized
  end
  
end
