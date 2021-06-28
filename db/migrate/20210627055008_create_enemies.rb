class CreateEnemies < ActiveRecord::Migration[6.1]
  def change
    create_table :enemies do |t|
      t.string :name
      t.string :reason
      t.integer :threat_level
      t.references :grudge,  foreign_key: true
      t.references :person,  foreign_key: true

      t.timestamps
    end
  end
end
