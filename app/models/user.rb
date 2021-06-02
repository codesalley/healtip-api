# frozen_string_literal: true

class User < ApplicationRecord
  before_save :downcase_email
  validates :email, uniqueness: true

  has_secure_password

  has_many :appointments, class_name: 'Appointment', dependent: :destroy
  has_many :doctors, through: :appointments, source: :user

  private

  def downcase_email
    self.email = email.downcase
  end
end
