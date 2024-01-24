Review.destroy_all if Rails.env.development?
Reservation.destroy_all if Rails.env.development?
Job.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

User.create!(
  user_name: "Rachid",
  email: "rachid111sabir@gmail.com",
  password: "secret",
  hour_rate: 4.5,
  role: "hrayfi"
)

User.create!(
  user_name: "Abdjalil",
  email: "jalil.yahy@gmail.com",
  password: "secret",
  role: "client"
)

Job.create!(
  title: "Painter",
  start_time: Time.now,
  end_time: Time.now,
  hrayfi_id: User.first.id,
  description: "Job description"
)

Reservation.create!(
  status: "Pending",
  job_id: Job.first.id,
  client_id: User.last.id
)

Review.create!(
  stars: 3,
  comments: "comentaire",
  job_id: Job.first.id
)
