class API::SessionsController < ApplicationController 
    def singup
        if params[:type].downcase == 'user'
            newUser = User.new(full_name: params[:full_name], email: params[:email], password_digest: params[:password], location: params[:location], age: params[:age] )
            newUser.save 
						if newUser.save 
							token = gen_token(newUser)
							render json: {s_token: token}, status: 200
						else
							render json: {msg: 'try again later'}, status: 400
						end
        end
        
        if params[:type].downcase == 'doctor'
					newUser = Doctor.new(full_name: params[:full_name], email: params[:email], category: params[:category], rating: 0, password_digest: params[:password], location: params[:location], age: params[:age] )
					newUser.save 
					if newUser.save 
						token = gen_token(newUser)
						render json: {s_token: token}, status: 200
					else
						render json: {msg: 'try again later'}, status: 400
					end
        end

    end
    def login
        render json: {msg: 'login route'}
    end

    private 
    EXP = Time.now.to_i + 7 * 3600
    SECRET_KEY = 'codesalley'
    ALGO = 'HS256'

    def gen_token(user)
        payload = { user_id: user.id, exp: EXP }
        token = JWT.encode payload, SECRET_KEY, ALGO
				return token
    end
end