class Job < ApplicationRecord
  has_one :reservation
  has_one :review
  belongs_to :client, foreign_key: :client_id, class_name: "User"
end
