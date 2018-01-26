# This migration comes from skooter (originally 20180122173131)
class CreateSkooterForms < ActiveRecord::Migration[5.1]
  def change
    create_table :skooter_forms do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
