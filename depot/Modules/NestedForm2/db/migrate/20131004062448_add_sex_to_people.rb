class AddSexToPeople < ActiveRecord::Migration
  def change
    add_column :people, :times, :integer
  end
end
