# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

publishers = [
  {
    name: 'Allison & Busby',
    books: [
      { title: 'The Spook Who Sat by the Door' },
      { title: 'Behold the Man' },
      { title: 'The Final Programme' }
    ]
  },
  {
    name: 'Baen Books',
    books: [
      { title: 'Bolo' },
      { title: 'Freehold War' },
      { title: 'Legacy of the Aldenata' }
    ]
  },
  {
    name: 'O\'Reilly Media',
    books: [
      { title: 'Building Microservices: Designing Fine-Grained Systems' },
      { title: 'Programming Rust' },
      { title: 'Learning JavaScript Design Patterns' }
    ]
  }
]

shops = [
  { name: 'Amazon' },
  { name: 'Ozon' },
  { name: 'Labirint' }
]

publishers.each do |p|
  publisher = Publisher.create(name: p[:name])
  Book.create([
                { title: p[:books][0][:title], publisher: publisher },
                { title: p[:books][1][:title], publisher: publisher },
                { title: p[:books][2][:title], publisher: publisher }
              ])
end

books = Book.all
shop = Shop.create(name: 'Amazon')
Store.create([
                { amount: (rand 0..10), shop: shop, book: books[0] },
                { amount: (rand 0..10), shop: shop, book: books[1] },
                { amount: (rand 0..10), shop: shop, book: books[3] }
              ])

shop = Shop.create(name: 'Ozon')
Store.create([
                { amount: (rand 0..10), shop: shop, book: books[2] },
                { amount: (rand 0..10), shop: shop, book: books[6] },
                { amount: (rand 0..10), shop: shop, book: books[7] },
                { amount: (rand 0..10), shop: shop, book: books[8] }
              ])

shop = Shop.create(name: 'Labirint')
Store.create([
                { amount: (rand 0..10), shop: shop, book: books[4] },
                { amount: (rand 0..10), shop: shop, book: books[5] }
              ])
