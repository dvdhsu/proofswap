# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Temporary admin account
u = User.new(
    email: "dvdhsu@gmail.com",
    password: "asdf",
    password_confirmation: "asdf",
    first_name: "David",
    last_name: "Hsu",
    college: "st-hughs",
    admin: true
)
u.skip_confirmation!
u.save!

# Test user accounts
(1..5).each do |i|
  u = User.new(
      email: "user#{i}@example.com",
      first_name: "User",
      last_name: i.to_s,
      college: "ccc",
      password: "asdf",
      password_confirmation: "asdf",
      admin: true
  )
  u.skip_confirmation!
  u.save!

  puts "#{i} test users created..." if (i % 5 == 0)

end
  

