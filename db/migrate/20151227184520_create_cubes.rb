class CreateCubes < ActiveRecord::Migration
  def change
    create_table :cubes do |t|
      t.float :cubex
      t.float :cubey
      t.float :cubez

      t.timestamps null: false
    end
  end
end
