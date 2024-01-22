class Job < ApplicationRecord
  has_one :reservation
  has_one :review
  belongs_to :client
end
