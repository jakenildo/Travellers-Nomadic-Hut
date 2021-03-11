class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.date :birthdate
      t.string :languages
      t.integer :contact_number
      t.string :profile_photo
      t.integer :account_type

      t.timestamps
    end
  end
end
