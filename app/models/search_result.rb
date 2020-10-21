class SearchResult < ApplicationRecord
  belongs_to :report
  validates :term, presence: true
end
