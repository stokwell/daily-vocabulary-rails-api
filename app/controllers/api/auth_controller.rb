module Api
  class AuthController < ApiController

  def create
    byebug
    raise request.env["omniauth.auth"].to_yaml
  end

  def destroy
  end
end
end
