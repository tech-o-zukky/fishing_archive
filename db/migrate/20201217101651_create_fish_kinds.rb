class CreateFishKinds < ActiveRecord::Migration[6.0]
  def change
    create_table :fish_kinds do |t|
      t.references  :record,      null: false, foreign_key: true
      t.string      :fish_name,   null: false 
      t.integer     :fish_count,  null: false 

      t.timestamps
    end
  end
end
