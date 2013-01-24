class CreatePopularDbs < ActiveRecord::Migration
  def change
    create_table :popular_dbs do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
