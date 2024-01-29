class Job < ApplicationRecord
  has_one :reservation
  has_one :review
  has_one_attached :preview
  belongs_to :hrayfi, foreign_key: :hrayfi_id, class_name: "User"
  validates :end_time, comparison: { greater_than: :start_time }
end
