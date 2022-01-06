class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.boolean :user_status
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
