class User < ApplicationRecord
    before_save :downcase_email
    has_secure_password
    has_many :appointments, class_name: "Appointment"
    has_many :doctors, :through => :appointments, source: :user


    private 
    def downcase_email
       return self.email.downcase
    end
end
