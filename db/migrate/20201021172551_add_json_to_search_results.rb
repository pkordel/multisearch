class AddJsonToSearchResults < ActiveRecord::Migration[6.0]
  def change
    add_column :search_results, :payload, :jsonb, default: '{}'
    add_index  :search_results, :payload, using: :gin
  end
end
