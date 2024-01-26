Review.destroy_all if Rails.env.development?
Reservation.destroy_all if Rails.env.development?
Job.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

20.times do
  username = Faker::Internet.username
  email = Faker::Internet.email
  hour_rate = [2,3.5,4,5.5,6.5,3].sample
  role = ["hrayfi","client"].sample
  User.create!(
  user_name: username,
  email: email,
  password: "secret",
  hour_rate: hour_rate,
  role: role
)
end

image_urls = [
  "https://media.istockphoto.com/id/1335440182/photo/printing-on-t-shirt-in-workshop.jpg?s=1024x1024&w=is&k=20&c=IfzUjk0aMI4sJDyqR8rNcRzDlS9KItErc0oVleysv-I=",
  "https://media.istockphoto.com/id/1335446675/photo/printing-on-t-shirt-in-workshop.jpg?s=1024x1024&w=is&k=20&c=saGpNLLFh6dwEhBKM9QEkDdClCGEPVxz9_SKPmr39x0=",
  "https://media.istockphoto.com/id/1081622610/photo/fashion-statement-with-sequin-lace-word-bling-on-her-t-shirt.jpg?s=1024x1024&w=is&k=20&c=MNUEHpQ8jLOZIKidtBekzeDL6Rw8VH7YVJNfD1h7W0s=",
  "https://media.istockphoto.com/id/1191080457/photo/printing-on-t-shirt-in-workshop.jpg?s=1024x1024&w=is&k=20&c=opA1scP25zvqbNWTHhE7MtGgCGLHdHYNmgFhbG6DP6A=",
  "https://media.istockphoto.com/id/955855956/photo/girl-in-black-t-shirt-with-embroidery-with-flowers-on-green-forest-background.jpg?s=1024x1024&w=is&k=20&c=ulwRTSIpJTpcr-gfg0Lu3bfFJoGjXvxhLHUghlALLdU=",
  "https://media.istockphoto.com/id/1372029517/photo/typical-shirt-for-men-of-tarija-bolivia.jpg?s=1024x1024&w=is&k=20&c=EQeBThH_ksBbzPZlW_tvEEV8nGH4u5zNJRkHJfVdkNY=",
  "https://media.istockphoto.com/id/1387933126/photo/fashionable-denim-jacket-isolated-on-textured-background.jpg?s=1024x1024&w=is&k=20&c=MuQmlq7hmkgeJo7grckDNqniWqOwY_cav2avZdnMcH0=",
  "https://images.unsplash.com/photo-1594587639781-a68a2796bb90?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
]

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
  cost: cost,
  preview: image_urls.sample
)
Reservation.create!(
  status: ["Pending","Accepted","Rejected","Finished"].sample,
  job_id: Job.last.id,
  client_id: User.where(role: "client").sample.id
)

end
