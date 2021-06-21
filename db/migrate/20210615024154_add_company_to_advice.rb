class AddCompanyToAdvice < ActiveRecord::Migration[6.0]
  def change
    add_reference :advices, :company, null: false, foreign_key: true
  end
end
