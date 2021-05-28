class Doctor < ApplicationRecord
    before_save :downcase_email
    has_secure_password
    validates :email, uniqueness: true


    has_many :appointments, class_name: 'Appointment', dependent: :destroy
    has_many :patients, through: :appointments, source: :doctor


    private
    def downcase_email
        return self.email = email.downcase
     end
end
