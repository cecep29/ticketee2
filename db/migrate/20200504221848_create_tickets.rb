class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :description
      t.references :project, index: true, foreign_key: true

      t.timestamps
    end
  end
end
