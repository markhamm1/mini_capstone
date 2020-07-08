Product.create!([
  {name: "Apple", price: "1.0", image_url: "https://image.shutterstock.com/image-photo/apple-isolated-on-white-background-260nw-559571917.jpg", description: "most versatle fruit", in_stock: nil},
  {name: "Banana", price: "2.0", image_url: "https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-320-80.jpg", description: "great with oatmeal and in bread", in_stock: nil},
  {name: "Strawberry", price: "3.0", image_url: "https://www.thermofisher.com/blog/food/wp-content/uploads/sites/5/2015/08/single_strawberry__isolated_on_a_white_background.jpg", description: "My daughter's favorite fruit", in_stock: nil},
  {name: "Pear", price: "3.0", image_url: "https://www.producemarketguide.com/sites/default/files/Commodities.tar/Commodities/pears_commodity-page.png", description: "Oddly shaped fruit", in_stock: nil},
  {name: "peach", price: "1.0", image_url: "https://images.eatthismuch.com/site_media/img/1484_hannahgothelf_9b6411ed-b690-46f6-b4db-48470bcb695c.jpg", description: "fuzzy, juicy goodness", in_stock: nil}
])

product = Product.new(
  name: Faker::Food.fruits
  price: Faker::Number.within(range: 1..10)
  image_url: 
  description: Faker::Lorem.sentence(word_count: 3)
)