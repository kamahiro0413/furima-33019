# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| lsat_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_reading  | string | null: false               |
| first_name_reading | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many : items
- has_many : purchases

## itemsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| item_name          | string     | null: false                   |
| explanation        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| condition_id       | integer    | null: false                   |
| shipping_cost_id   | integer    | null: false                   |
| shipping_area_id   | integer    | null: false                   |
| days_to_ship_id    | integer    | null: false                   |
| price              | integer    | null: false                   |
| seller_id          | references | null: false,foreign_key: true |

### Association
- belongs_to : user
- has_one : purchase

## purchasesテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| item_id            | references | null: false,foreign_key: true |
| buyer_id           | references | null: false,foreign_key: true |

### Association
- belongs_to : user
- belongs_to : purchase
- has_one    : address

## addressesテーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| postal_code   | string     | null: false                   |
| prefecture    | integer    | null: false                   |
| city          | string     | null: false                   |
| house_number  | string     | null: false                   |
| building_name | string     |                               |
| phone_num     | string     | null: false                   |
| purchase_id   | references | null: false,foreign_key: true |

### Association
- belongs_to : purchase