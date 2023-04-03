class CreateBeers < ActiveRecord::Migration[7.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :abv
      t.string :style
      t.string :brewery
      t.text :profile
      t.text :image

      t.timestamps
    end
  end
end
