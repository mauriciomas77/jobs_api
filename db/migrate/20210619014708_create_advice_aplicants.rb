class CreateAdviceAplicants < ActiveRecord::Migration[6.0]
  def change
    create_table :advice_aplicants do |t|
      t.integer :advice_id
      t.integer :aplicant_id
      t.integer :status_id, null: false, default: 1

      t.timestamps
    end
  end
end
