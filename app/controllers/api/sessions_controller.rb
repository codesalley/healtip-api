class Api::SessionsController < ApplicationController 
    def singup
        if params[:type].downcase == 'user'

            render json: {msg: 'singup for user'}
        end
        
        if params[:type].downcase == 'doctor'

            render json: {msg: 'singup for doctor'}
        end

    end
    def login
        render json: {msg: 'login route'}
    end
end