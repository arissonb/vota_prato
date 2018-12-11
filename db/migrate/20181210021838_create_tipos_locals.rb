class CreateTiposLocals < ActiveRecord::Migration[5.2]
  def change
    create_table :tipos_locals do |t|
      t.string :tipo

      t.timestamps
    end
  end
end
