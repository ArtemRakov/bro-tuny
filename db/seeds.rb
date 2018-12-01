developer = Developer.create(name: "Developer")


house_complex = HouseComplex.create(name: "HouseComplex", address: "Addresss", developer: developer)


house = House.create(number: 1, house_complex: house_complex)

stage = Stage.create(house: house, title: "Stage 1")

User.create(email: 'admin@admin.com', password: '123123', house: house)

puts 'Done!'
