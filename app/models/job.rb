class Job < ApplicationRecord
  has_one :reservation
  has_one :review
  belongs_to :hrayfi, foreign_key: :hrayfi_id, class_name: "User"
end
