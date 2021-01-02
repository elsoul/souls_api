class CreateKeyGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :key_groups do |t|
      t.string :name
      t.string :key_name
      t.integer :total_key_num, default: 0

      t.timestamps
    end
  end
end
