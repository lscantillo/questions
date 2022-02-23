# frozen_string_literal: true

class ApplicationController < ActionController::API
  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    begin
      @decoded = JsonWebToken::Encoder.decode(header)
      @current_user = Employee.find_by_email(@decoded['email'])

    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unauthorized
      
    rescue JWT::DecodeError => e
      render json: { error: e.message }, status: :unauthorized
      
  end

end
