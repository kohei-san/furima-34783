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
| birthday           | deta    | null: false

### association
- has_many :items
- has_many :orders

## itemsテーブル

| columns              | style      | option
|----------------------------------------------------------
| name                 | string     | null: false
| info                 | text       | null: false
| category_id          | integer    | null: false
| sales_status_id      | integer    | null: false
| shipping_fee_id   	 | integer    | null: false
| prefecture_id        | integer    | null: false
| schedule_delivery_id | integer    | null: false
| price	               | integer    | null: false
| user_id              | references | null: false, foreign_key:true

### association
- belongs_to :user
- has_one :order


## ordersテーブル

| columns    | style      | option
|----------------------------------------------------------
| user_id    | references | null: false foreign_key: true
| item_id    | references | null: false foreign_key: true

### association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressテーブル

| columns              | style      | option
|----------------------------------------------------------
| postal_code          | string     | null: false
| prefecture_id        | integer    | null: false
| city                 | string     | null: false
| address              | string     | null: false
| building             | string     |
| phone_number         | string     | null: false
| order_id             | references | null: false, foreign_key: true

### association
- belongs_to :order