class Reservation < ApplicationRecord
  belongs_to :job
  belongs_to :hrayfi, foreign_key: :hrayfi_id, class_name: "User"
end
