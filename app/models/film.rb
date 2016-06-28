class Film < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :year, presence: true, inclusion: { in: 1900..2020 }
  validates :watched, presence: true
end
