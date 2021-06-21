class User < ApplicationRecord
  has_secure_password
  has_one :company
  has_many :advice_aplicants, foreign_key: :aplicant_id
  has_many :advices, through: :advice_aplicants
  validates :email, presence: true
  validates :email, uniqueness: true

  def company?
    user_type == 'company'
  end
end
