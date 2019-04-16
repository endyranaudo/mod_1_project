class CreateClasses < ActiveRecord::Migration[5.2]

  def change
    create_table :users do |t|
      t.string :name

      t.integer :points, :default => 0
    end

    create_table :artists do |t|
      t.string :name

      t.timestamps
    end

    create_table :albums do |t|
      t.string :title
      t.string :artist_id

      t.timestamps
    end

    create_table :questions do |t|
      t.integer :user_id
      t.integer :album_id

      t.timestamps
    end
  end
end
