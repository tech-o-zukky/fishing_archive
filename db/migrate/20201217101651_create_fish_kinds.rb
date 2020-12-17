class CreateFishKinds < ActiveRecord::Migration[6.0]
  def change
    create_table :fish_kinds do |t|

      t.timestamps
    end
  end
end
