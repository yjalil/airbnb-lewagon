class Reservation < ApplicationRecord
  belongs_to :job
  belongs_to :client, foreign_key: :client_id, class_name: "User"
end
