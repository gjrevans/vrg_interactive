class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :slug
      t.string :title
      t.text :body
      t.string :meta_title
      t.text :meta_description
      t.string :image_url
      t.timestamps
    end
  end
end
