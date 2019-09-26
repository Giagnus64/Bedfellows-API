class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.datetime :anniversary
      t.datetime :start_date
      t.datetime :first_date
      t.string :nickname
      t.integer :asker_id
      t.integer :askee_id

      t.timestamps
    end
  end
end
