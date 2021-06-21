class Company < ApplicationRecord
  belongs_to :user
  validates :company_name, presence: true
  has_many :advices
end
