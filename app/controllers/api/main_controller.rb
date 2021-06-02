# frozen_string_literal: true

module API
  class MainController < ApplicationController
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
        nil
      end
    end

    def doctors
      doctors = Doctor.all
      render json: doctors
      nil
    end

    def book
      patient = User.find_by(id: params[:user_id])
      doctor = Doctor.find_by(id: params[:doctor_id])
      aptTime = params[:time]
      newApt = patient.appointments.build(doctor_id: doctor.id, name: "Apt with #{doctor.full_name}", time: aptTime,
                                          category: params[:category], pending: true, info: params[:info], location: params[:location])
      if newApt.save
        render json: newApt
        nil
      else
        render json: { msg: 'Try again later' }
        nil

      end
    end

    def delete
      user_id = decode_token(request.headers['s-token'])
      user = User.find_by(id: user_id)
      apt = user.appointments.find_by(id: params[:id].to_i)
      render json: { msg: 'Appointment deleted' }
    end

    def appoitments
      user_id = decode_token(request.headers['s-token'])
      user = User.find_by(id: user_id)
      apt = user.appointments.all
      render json: apt
    end

    def favorite
      user_id = decode_token(request.headers['s-token'])
      user = User.find_by(id: user_id)
      drs  = Doctor.find_by(id: params[:id].to_i)

      if user.favorites.nil?
        user.favorites = [drs.as_json]
        user.save
        render json: user
        nil
      else
        if user.favorites.include?(drs.as_json)
          render json: { msg: 'already added' }
          return
        end
        user.favorites.push(drs.as_json)
        user.save
        render json: user
        nil
      end
    end

    def removeFav
      user_id = decode_token(request.headers['s-token'])
      user = User.find_by(id: user_id)
      user.favorites.delete_at(params[:id].to_i)
      user.save
      render json: user
    end
  end
end
