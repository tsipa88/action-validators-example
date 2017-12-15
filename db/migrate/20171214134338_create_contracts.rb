class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :client
      t.string :address
      t.integer :price
      t.integer :percent
      t.string :status

      t.timestamps
    end
  end
end
