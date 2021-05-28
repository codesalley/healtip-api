class API::MainController < ApplicationController
    before_action :auth_token

    def profile
        user_id = decode_token(request.headers['s-token'])
        if request.headers['type'] == 'user'
            user = User.find_by(id: user_id)
            render json: user
            return
        end
        if request.headers['type'] == 'doctor'
            doctor = Doctor.find_by(id: user_id)
            render json: doctor
            return 
        end
     
    end
end