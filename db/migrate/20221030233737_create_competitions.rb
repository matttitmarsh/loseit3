class CreateCompetitions < ActiveRecord::Migration[7.0]
  def change
    create_table :competitions do |t|
      t.string :title
      t.date :start_date
      t.date :finish_date

      t.timestamps
    end
  end
end
