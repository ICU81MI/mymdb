class Film < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_all, :against => [:title, :year, :watched, :rating]

  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :year, presence: true
  validates :watched, presence: true
  # validates :rating, inclusion: { in: 1..5 }
  validates :user_id, presence: true

  paginates_per 10

  def self.search(query)
   where("title ilike ?", "%#{query}%")
  end
end
