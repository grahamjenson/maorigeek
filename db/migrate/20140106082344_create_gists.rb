class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.string :gist_id
      t.timestamps
    end
  end
end
