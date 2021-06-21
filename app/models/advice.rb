class Advice < ApplicationRecord
  belongs_to :company
  has_many :advice_aplicants, foreign_key: :advice_id
  has_many :aplicants, source: :aplicant, through: :advice_aplicants
  has_many :aplicants_status, source: :status, through: :advice_aplicants
  validates :title, presence: true
  validates :description, presence: true
end
