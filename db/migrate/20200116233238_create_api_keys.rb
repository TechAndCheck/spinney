class CreateApiKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :api_keys do |t|
      t.string :key, null: false, unique: true
      t.string :name
      t.datetime :last_used
      t.timestamps

      t.index :key
    end
  end
end
