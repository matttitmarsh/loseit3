class CreateWeightRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :weight_records do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :competition, null: false, foreign_key: true
      t.numeric :weight, null: false
      t.date :effective_date, null: false

      t.timestamps
    end
  end
end
