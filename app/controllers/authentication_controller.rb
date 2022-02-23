class AuthenticationController < ApplicationController
  def login
    # This method must be connected to our authentication service
    begin
      # Example usage of the JWT class

      # Here is where the user gets authenticated, this is the simpliest example
      # employee = Employee.find_by_email(params[:email])

      # Generate the token with all the data that will be encrypted as hash, optionaly
      # pass a timestamp for the expiration date of the token as second parameter
      # token = JsonWebToken::Encoder.encode({email: employee.email}, 5.days.from_now)

      # render json: {token: token}, status: :ok

    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unauthorized
    end
  end
end
