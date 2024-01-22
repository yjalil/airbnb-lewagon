Review.destroy_all if Rails.env.development?
Reservation.destroy_all if Rails.env.development?
Job.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

User.create!(
  user_name: "Rachid",
  email: "rachid111sabir@gmail.com",
  password: "123456",
  hour_rate: 4.5
)

Job.create!(
  title: "Job Title",
  start_time: Time.now,
  end_time: Time.now,
  client_id: User.first.id,
  description: "Job description"
)

Reservation.create!(
  status: "Pending",
  job_id: Job.first.id,
  hrayfi_id: User.first.id
)

Review.create!(
  stars: 3,
  comments: "comentaire",
  job_id: Job.first.id
)
