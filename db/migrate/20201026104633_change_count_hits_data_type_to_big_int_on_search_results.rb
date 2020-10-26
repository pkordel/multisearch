class ChangeCountHitsDataTypeToBigIntOnSearchResults < ActiveRecord::Migration[6.0]
  def change
    change_column :search_results, :count_hits, :bigint
  end
end
