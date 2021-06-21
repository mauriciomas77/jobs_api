class Status < ApplicationRecord
  has_many :advice_aplicants, foreign_key: :status_id
end
