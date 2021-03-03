class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :user
      t.text :address
      t.json :coordinate
      t.string :share_type, default: "public"
      t.string :user_ids, array: true
      t.timestamps
    end
    add_index :addresses, :user_ids, using: 'gin'
  end
end
