class AdviceAplicant < ApplicationRecord
  belongs_to :aplicant, class_name: 'User'
  belongs_to :advice
  belongs_to :status
end
