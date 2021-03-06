role_titles = ['Admin', 'User']
genders = ['male', 'female']
active_toggle = [true, false]
max_birth_date = Date.parse('01.01.2000')
min_birth_date = Date.parse('01.01.1980')

if Role.count == 0
  role_titles.each { |role_title| Role.create(title: role_title) }
end

if User.count == 0
  User.create(first_name: 'John', last_name: 'Doe', email: 'admin@mail.com',
              gender: 'male', birth_date: Date.parse('26.12.1989'),
              active: true, role: Role.find_by_title(role_titles.first),
              password: '1234qwer')
  User.create(first_name: 'Mike', last_name: 'Gorn', email: 'user@mail.com',
              gender: 'male', birth_date: Date.parse('11.12.2000'),
              active: true, role: Role.find_by_title(role_titles.last),
              password: '1234qwer')

  50.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                email: Faker::Internet.email, gender: genders.sample,
                birth_date: rand(min_birth_date..max_birth_date),
                active: active_toggle.sample, role: Role.find_by_title(role_titles.sample),
                password: Faker::Internet.password)
  end
end
