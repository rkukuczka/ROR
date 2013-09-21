# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all
Product.create!(
    :title => "Programming Ruby 1",
    :description => %{<p><em>Programming Ruby</em> This is a bug</p>},
    :price=>1.99,
    :image_url => "rails.png"
)

Product.create!(
    :title => "Programming Ruby 2",
    :description => %{<p><em>Programming Ruby</em> This is a bug</p>},
    :price=>2.99,
    :image_url => "rails.png"
)

Product.create!(
    :title => "Programming Ruby 3",
    :description => %{<p><em>Programming Ruby</em> This is a bug</p>},
    :price=>3.99,
    :image_url => "rails.png"
)
