class Doctor < ApplicationRecord
    has_many :appointments, class_name: 'Appointment'
    has_many :patients, through: :appointments, source: :doctor
end
