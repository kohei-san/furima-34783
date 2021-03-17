# FurimaApp

## usersテーブル

| columns         | style | option
|----------------------------------------------------------
| nickname        | string | null: false
| email           | string | null: false
| password        | string | null: false
| last_name       | string | null: false
| first_name      | string | null: false
| last_name_kana  | string | null: false
| first_name_kana | string | null: false
| order_id        | integer| references foreign_key: true

### association
- has_many :items
- has_many :orders



## itemsテーブル

| columns              | style   | option
|----------------------------------------------------------
| name                 | string  | null:false
| info                 | text    | null:false
| category_id          | integer | null:false
| sales_status_id      | integer | null:false
| shipping_fee_id   	 | integer | null:false
| schedule_delivery_id | integer | null:false
| price	               | integer | null:false
| sold                 | integer | null:false   # sold "1"で販売済み
| image                |         | 

### association
- belongs_to :user
- has_one :order



## ordersテーブル

| columns              | style   | option
|----------------------------------------------------------
| postal_code          | string  | null: false
| prefecture_id        | integer | null: false
| city                 | string  | null: false
| address              | string  | null: false
| building             | string  |
| phone_number         | integer | null: false
| user_id              | integer | references foreign_key: true

### association
belongs_to :item
belongs_to :user