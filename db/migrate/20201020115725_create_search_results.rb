class CreateSearchResults < ActiveRecord::Migration[6.0]
  def change
    create_table :search_results do |t|
      t.references :report, null: false, foreign_key: true, index: true
      t.integer    :count_adwords_advertisers
      t.integer    :count_links
      t.integer    :count_hits
      t.decimal    :elapsed_time, precision: 5, scale: 2
      t.text :html

      t.timestamps
    end
  end
end
