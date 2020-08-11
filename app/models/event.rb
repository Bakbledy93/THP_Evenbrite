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

  # validates :start_date, presence: true
  #   validate :correct_time
  # validates :duration, presence: true,
  #   validate :duration_is_multiple_of_5
  # validates :title, presence: true, length: { in 5..140 }
  # validates :description, presence: true, length: { in 20..1000 }
  # validates :price, presence: true, numericality: { less_than_or_equal_to: 1000, only_integer: true }
  # validates :location, presence: true

  # def correct_time
  #   errors.add(:start_time, "The date canoot be in the past") if start_time < Time.now
  # end

  # def duration_is_multiple_of_5
  #   if duration.nil?
  #     errors.add(:duration), "You must give a duration."
  #   else
  #     errors.add(:duration), "The duration must be a positive number." unless > 0
  #     errors.add(:duration), "the duration must be a multiple of 5." unless % 5 == 0
  #   end

  # end