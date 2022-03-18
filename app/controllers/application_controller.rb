# frozen_string_literal: true

class ApplicationController < ActionController::API
  def authorize_request
    header = request.headers['Authorization']
    header = header.split.last if header

    begin
      @decoded = JsonWebToken::Encoder.decode(header)
      raise JWT::ExpiredError, header if (Time.now <=> Time.at(@decoded['exp'])) == 1

      @current_user = Employee.find_by_email(@decoded['email'])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    rescue JWT::DecodeError => e
      render json: { error: e.message }, status: :internal_error
    rescue JWT::ExpiredError => e
      render json: { error: e.message }, status: :unauthorized
    end
  end
end
