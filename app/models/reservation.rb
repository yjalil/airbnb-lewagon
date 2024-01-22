class Reservation < ApplicationRecord
  belongs_to :job
  belongs_to :user
end
