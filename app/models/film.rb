class Film < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :year, presence: true
  validates :watched, presence: true
end
