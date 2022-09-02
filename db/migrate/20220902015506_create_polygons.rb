class CreatePolygons < ActiveRecord::Migration[7.0]
  def change
    create_table :polygons do |t|
      t.string :name

      # This column is used for the ActiveJsonModel array
      # This column would be better served with jsonb if this was Postgres...
      t.json :points

      t.timestamps
    end
  end
end
