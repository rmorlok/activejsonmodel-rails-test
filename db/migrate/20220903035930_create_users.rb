class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name

      # This column is used for the ActiveJsonModel
      # This column would be better served with jsonb if this was Postgres...
      t.json :credentials

      t.timestamps
    end
  end
end
