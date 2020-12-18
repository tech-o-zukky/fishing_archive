class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string  :title,              null: false
      t.date    :date,               null: false
      t.integer :prefecture_id,      null: false
      t.string  :area
      t.string  :place
      t.boolean :timing1,            null: false, default: false
      t.boolean :timing2,            null: false, default: false
      t.boolean :timing3,            null: false, default: false
      t.boolean :timing4,            null: false, default: false
      t.boolean :timing5,            null: false, default: false
      t.boolean :timing6,            null: false, default: false
      t.boolean :timing7,            null: false, default: false
      t.integer :weather_id
      t.integer :wind_id
      t.float   :temperature
      t.float   :water_temperature
      t.integer :wave_id
      t.integer :water_quality_id
      t.integer :tide_id
      t.text    :content,            null: false
      t.references  :user,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
