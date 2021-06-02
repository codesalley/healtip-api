# frozen_string_literal: true

class ApplicationController < ActionController::API
  SECRET_KEY = 'codesalley'
  ALGO = 'HS256'

  def auth_token
    token = request.headers['s-token']

    begin
      decoded_token = JWT.decode token, SECRET_KEY, true, { algorithm: ALGO }
      user_id = decoded_token[0]['user_id']
      if request.headers['type'] == 'user'
        user = User.find_by(id: user_id)
        return true if user

        render json: { error: 'Try again later' }, status: 400
        return false
      end
      if request.headers['type'] == 'doctor'
        user = Doctor.find_by(id: user_id)
        return true if user

        render json: { error: 'Try again later' }, status: 400
        return false
      end
      render json: { error: 'Try again later' }, status: 400
      false
    rescue Exception => e
      render json: { error: 'Try again later' }, status: 400
    end
  end

  def decode_token(token)
    decoded_token = JWT.decode token, SECRET_KEY, true, { algorithm: ALGO }
    decoded_token[0]['user_id']
  rescue Exception => e
    e
  end
end
