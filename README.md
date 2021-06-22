# README

## users table

| Column                | Type       | Options     |
|-----------------------|------------|------------ |
| email                 | string     | null: false |
| nickname              | string     | null: false |
| encrypted_password    | string     | null: false |
| name                  | string     | null: false |
| birthday              | date       | null: false |

### Association

* has_many :items
* has_many :records

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
| price                | string      | null: false |

### Association

* belongs_to :informations
* has_one :records

## purchases tablef

| Column          | Type      | Options     |
|-----------------|-----------|-------------|
| date_and_time   | string    | null: false |

### Asspcoation

* belongs_to : users
* has_one :items

## information table

| Column        | Type        | Options           |
|---------------|-------------|-------------------|
| postal_code   | string      | null: false       |
| prefecture    | string      | null: false       |
| municipality  | string      | null: false       |
| house_number  | string      | null: false       |
| building      | string      |                   |
| phone_number  | string      | null: false       |
| purchase      | references  | foreign_key: true |