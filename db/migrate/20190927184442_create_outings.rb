class CreateOutings < ActiveRecord::Migration[5.2]
  def change
    create_table :outings do |t|
      t.belongs_to :relationship, foreign_key: true
      t.string :location
      t.string :activity
      t.datetime :time

      t.timestamps
    end
  end
end
