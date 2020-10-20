class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
