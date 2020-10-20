Fabricator(:user) do
  email    FFaker::Internet.email
  password '123456'
end
