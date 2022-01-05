class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.string :name
      t.boolean :like, default: nil

      t.timestamps
    end
  end
end
