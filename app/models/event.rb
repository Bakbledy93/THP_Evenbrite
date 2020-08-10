class Event < ApplicationRecord
  validates :start_date, presence: true
  validates :duration, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true

  
  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :guests, through: :attendances

end
