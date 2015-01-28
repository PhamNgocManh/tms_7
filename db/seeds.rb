User.create!(name:  "Admin",
             email: "admin@tms.com",
             require_password: true,
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             )

User.create!(name:  "Example User",
             email: "user@tms.com",
             require_password: true,
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false,
             )