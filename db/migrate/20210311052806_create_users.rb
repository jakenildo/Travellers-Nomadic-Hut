class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :contact_number
      t.string :profile_photo

      t.timestamps
    end
  end
end
