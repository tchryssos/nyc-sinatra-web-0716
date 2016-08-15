class CreateTitlesTimeThreeWow < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.integer :name
    end
  end
end
