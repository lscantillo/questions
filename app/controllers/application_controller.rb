# frozen_string_literal: true

class ApplicationController < ActionController::API
  def authorize_request
    header = request.headers['Authorization']
    header = header.split.last if header

    begin
      raise Api::EmptyHeader.new(888) if header.nil?
      @decoded = JsonWebToken::Encoder.decode(header)
      raise JWT::ExpiredError, header if (Time.now <=> Time.at(@decoded['exp'])) == 1

      @current_user = Employee.find_by_email(@decoded['email'])
    rescue Api::EmptyHeader => e
      render json: { code: e.code, error: "No authorization token provided in header" }, status: :unauthorized
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    rescue JWT::DecodeError => e
      render json: { error: "Could not decode authetication token", status_code: 401}, status: :unauthorized
    rescue JWT::ExpiredError => e
      render json: { error: e.message }, status: :unauthorized
    end
  end


end
