Review.destroy_all if Rails.env.development?
Reservation.destroy_all if Rails.env.development?
Job.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

20.times do
  username = Faker::Internet.username
  email = Faker::Internet.email
  hour_rate = [2,3.5,4,5.5,6.5,3,nil].sample
  role = ["hrayfi","client"].sample
  User.create!(
  user_name: username,
  email: email,
  password: "secret",
  hour_rate: hour_rate,
  role: role
)
end

45.times do
  start_time = Time.now
  end_time = start_time + rand(1..100).days
  hrayfi = User.where(role: "hrayfi").sample
  cost = ((end_time - start_time)/1.hour).round * hrayfi.hour_rate
  Job.create!(
  title: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
  start_time: start_time,
  end_time: end_time,
  hrayfi_id: hrayfi.id,
  description: Faker::Lorem.paragraph(sentence_count: 4),
  cost: cost
)
Reservation.create!(
  status: ["Pending","Accepted","Rejected","Finished"].sample,
  job_id: Job.last.id,
  client_id: User.where(role: "client").sample.id
)

end
