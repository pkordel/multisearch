class Report < ApplicationRecord
  belongs_to :user
  has_one_attached :keyword_list
  has_many :search_results, dependent: :destroy
  validates :title, :keyword_list, presence: true
end
