class Film < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :year, presence: true
  validates :watched, presence: true
  validates :user_id, presence: true

  paginates_per 10

  def self.search(query)
   where("title ilike ?", "%#{query}%")
  end
end
