class Foos < ActiveRecord::Migration
  def change
    create_table :foos do |t|
      t.timestamps
    end
    create_table :bars do |t|
      t.belongs_to :foo
      t.timestamps
    end
  end
end
