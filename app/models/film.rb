class Film < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :year, presence: true
  validates :watched, presence: true
  # validates :rating, inclusion: { in: 1..5 }
  validates :user_id, presence: true
end
