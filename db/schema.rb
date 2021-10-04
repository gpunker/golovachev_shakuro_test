# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_211_004_053_856) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'books', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'slug'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'publisher_id'
    t.index ['publisher_id'], name: 'index_books_on_publisher_id'
  end

  create_table 'friendly_id_slugs', force: :cascade do |t|
    t.string 'slug', null: false
    t.integer 'sluggable_id', null: false
    t.string 'sluggable_type', limit: 50
    t.string 'scope'
    t.datetime 'created_at'
    t.index %w[slug sluggable_type scope], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope',
                                           unique: true
    t.index %w[slug sluggable_type], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type'
    t.index %w[sluggable_type sluggable_id], name: 'index_friendly_id_slugs_on_sluggable_type_and_sluggable_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.integer 'amount', default: 1
    t.bigint 'book_id', null: false
    t.bigint 'shop_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['book_id'], name: 'index_orders_on_book_id'
    t.index ['shop_id'], name: 'index_orders_on_shop_id'
  end

  create_table 'publishers', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'slug'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['name'], name: 'index_publishers_on_name', unique: true
  end

  create_table 'shops', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'slug'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'total_sold', default: 0
    t.index ['name'], name: 'index_shops_on_name', unique: true
  end

  create_table 'stores', force: :cascade do |t|
    t.integer 'amount', default: 0
    t.bigint 'book_id', null: false
    t.bigint 'shop_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['book_id'], name: 'index_stores_on_book_id'
    t.index ['shop_id'], name: 'index_stores_on_shop_id'
  end

  add_foreign_key 'orders', 'books'
  add_foreign_key 'orders', 'shops'
  add_foreign_key 'stores', 'books'
  add_foreign_key 'stores', 'shops'
end
