# frozen_string_literal: true

module API
  class SessionsController < ApplicationController
    def signup
      if params[:type].downcase == 'user'
        newUser = User.new(full_name: params[:full_name], email: params[:email],
                           password_digest: params[:password], location: params[:location], age: params[:age])
        newUser.save
        if newUser.save
          token = gen_token(newUser)
          render json: { s_token: token }, status: 200
        else
          render json: { msg: 'try again later' }, status: 400
        end
      end

      if params[:type].downcase == 'doctor'
        newUser = Doctor.new(full_name: params[:full_name], email: params[:email], category: params[:category],
                             rating: 0, password_digest: params[:password], location: params[:location], age: params[:age])
        newUser.save
        if newUser.save
          token = gen_token(newUser)
          render json: { s_token: token }, status: 200
        else
          render json: { msg: 'try again later' }, status: 400
        end
      end
    end

    def login
      if params[:type] == 'user'
        newUser = User.find_by(email: params[:email].downcase)
        if newUser
          render json: { s_token: gen_token(newUser) } if newUser.password_digest == params[:password]
          render json: { msg: 'invalid credentials' } if newUser.password_digest != params[:password]
        else
          render json: { msg: 'invalid credentials' }, status: 400
        end
      end
      if params[:type] == 'doctor'
        newDoctor = Doctor.find_by(email: params[:email].downcase)
        if newDoctor
          render json: { s_token: gen_token(newDoctor) } if newDoctor.password_digest == params[:password]
          render json: { msg: 'invalid credentials' } if newDoctor.password_digest != params[:password]
        else
          render json: { msg: 'invalid credentials' }, status: 400
        end
      end
    end

    private

    EXP = Time.now.to_i + 7 * 3600
    SECRET_KEY = 'codesalley'
    ALGO = 'HS256'

    def gen_token(user)
      payload = { user_id: user.id, exp: EXP }
      JWT.encode payload, SECRET_KEY, ALGO
    end
  end
end
