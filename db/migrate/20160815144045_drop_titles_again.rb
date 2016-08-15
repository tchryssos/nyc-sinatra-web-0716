class DropTitlesAgain < ActiveRecord::Migration
  def change
    drop_table :titles
  end
end
