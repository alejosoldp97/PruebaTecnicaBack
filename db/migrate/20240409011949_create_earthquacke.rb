class CreateEarthquacke < ActiveRecord::Migration[7.0]
  def change
    create_table :earthquackes do |t|
      t.decimal :magnitude
      t.string :external_id
      t.string :place
      t.string :time
      t.boolean :tsunami
      t.string :mag_type
      t.string :title
      t.decimal :longitude
      t.decimal :latitude
      t.string :external_url

      t.timestamps
    end
  end
end
