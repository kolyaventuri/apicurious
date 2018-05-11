class Api::V1::TokenController < ApplicationController
  def show
    result = {token: nil}
    result[:token] = current_user.token if current_user
    render json: result
  end
end
