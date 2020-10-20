# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.find_by(email: 'user@example.com') ||
       Fabricate(:user, email: 'user@example.com', password: 'secret')
5.times do
  report = Fabricate(:report, user: user)
  5.times do
    Fabricate(:search_result, report: report)
  end
end
