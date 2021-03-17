# FurimaApp

## usersテーブル

| columns            | style   | option
|----------------------------------------------------------
| nickname           | string  | null: false, unique: true
| email              | string  | null: false, unique: true
| encrypted_password | string  | null: false
| last_name          | string  | null: false
| first_name         | string  | null: false
| last_name_kana     | string  | null: false
| first_name_kana    | string  | null: false

### association
- has_many :items
- has_many :orders
- has_many :purchases



## itemsテーブル

| columns              | style   | option
|----------------------------------------------------------
| name                 | string  | null: false
| info                 | text    | null: false
| category_id          | integer | null: false
| sales_status_id      | integer | null: false
| shipping_fee_id   	 | integer | null: false
| prefecture_id        | integer | null: false
| schedule_delivery_id | integer | null: false
| price	               | integer | null: false

### association
- belongs_to :user
- has_one :order
- has_one :purchase



## ordersテーブル

| columns              | style   | option
|----------------------------------------------------------
| postal_code          | string  | null: false
| prefecture_id        | integer | null: false
| city                 | string  | null: false
| address              | string  | null: false
| building             | string  |
| phone_number         | integer | null: false
| purchase_id          | integer | foreign_key: true

### association
belongs_to :item
has_many :users
has_one  :purchase

## purchasesテーブル

| columns  | style   | option
|----------------------------------------------------------
| user_id  | integer | foreign_key: true
| item_id  | integer | foreign_key: true
| order_id | integer | foreign_key: true

- belongs_to :user
- belongs_to :item
- belongs_to :order