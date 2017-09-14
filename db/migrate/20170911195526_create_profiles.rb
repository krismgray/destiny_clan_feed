class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :gamertag, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
