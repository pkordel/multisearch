class AddTermToSearchResults < ActiveRecord::Migration[6.0]
  def change
    add_column :search_results, :term, :text
  end
end
