class CreateSolves < ActiveRecord::Migration[6.0]
  def change
    create_table :solves do |t|
      t.string :seconds
      t.string :scramble

      t.timestamps
    end
  end
end
