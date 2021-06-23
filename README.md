# README

## users table

| Column                | Type       | Options                  |
|-----------------------|------------|--------------------------|
| email                 | string     | null: false unique: true |
| nickname              | string     | null: false              |
| encrypted_password    | string     | null: false              |
| last_name             | string     | null: false              |
| first_name            | string     | null: false              |
| ruby_last_name        | string     | null: false              |
| ruby_first_name       | string     | null: false              |
| birthday              | date       | null: false              |

### Association

* has_many :items
* has_many :purchases

## items table

| Column               | Type        | Options     |
|----------------------|-------------|-------------|
| name                 | string      | null: false |
| description          | text        | null: false |
| category_id          | integer     | null: false |
| status_id            | integer     | null: false |
| shipping_charge_id   | integer     | null: false |
| shipping_area_id     | integer     | null: false |
| day_to_ship_id       | integer     | null: false |
| price                | integer     | null: false |

### Association

* belongs_to :user
* has_one :purchase

## purchases table

| Column          | Type        | Options                       |
|-----------------|-------------|-------------------------------|
| date_and_time   | string      | null: false                   |
| user            | references  | null: false foreign_key: true |
| item            | references  | null: false foreign_key: true |

### Asspcoation

* has_many : users
* belongs_to :item

## information table

| Column        | Type        | Options           |
|---------------|-------------|-------------------|
| postal_code   | string      | null: false       |
| prefecture    | integer     | null: false       |
| municipality  | string      | null: false       |
| house_number  | string      | null: false       |
| building      | string      |                   |
| phone_number  | string      | null: false       |
| purchase      | references  | foreign_key: true |