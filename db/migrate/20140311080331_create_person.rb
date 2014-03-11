class CreatePerson < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :email
      t.string :authentication_token
      t.timestamps
    end
  end
end
