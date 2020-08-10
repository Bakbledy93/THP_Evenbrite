class User < ApplicationRecord
  has_many :events
  has_many :events, through: :attendances

  has_many :events, foreign_key: 'admin_id', class_name: "Event"
  has_many :attendances, foreign_key: 'participant_id', class_name:"Attendance"
end
