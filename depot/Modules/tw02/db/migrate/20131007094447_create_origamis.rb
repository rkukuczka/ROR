class CreateOrigamis < ActiveRecord::Migration
  def change
    create_table :origamis do |t|
      t.string :name
      t.string :author

      t.timestamps
    end
  end
end
