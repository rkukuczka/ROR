# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all
Product.create(
    :title => "Programming Ruby 2",
    :description => %{<p><em>Programming Ruby</em> This is a bug</p>},
    :price=>4.99
)

Product.create(
    :title => "Programming Ruby 3",
    :description => %{<p><em>Programming Ruby</em> This is a bug</p>},
    :price=>4.99
)

Product.create(
    :title => "Programming Ruby 4",
    :description => %{<p><em>Programming Ruby</em> This is a bug</p>},
    :price=>4.99
)
