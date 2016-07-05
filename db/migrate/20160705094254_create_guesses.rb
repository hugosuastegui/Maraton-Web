class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :rights, default: 0
      t.integer :wrongs, default: 0
      t.belongs_to :user
      t.timestamps
    end
  end
end
