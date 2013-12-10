class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :uuid,  :null => false
      t.string :state, :default => "draft"
      t.string :title, :null => false
      t.string :slug

      t.integer :user_id

      t.text :markdown

      t.datetime :published_at
      t.timestamps

    end
  end
end
