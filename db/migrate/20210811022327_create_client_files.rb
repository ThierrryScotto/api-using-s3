class CreateClientFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :client_files do |t|
      t.string :name
      t.string :id_client

      t.timestamps
    end
  end
end
