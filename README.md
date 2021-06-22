# README

## users table

| Column                | Type       | Options     |
|-----------------------|------------|------------ |
| email                 | string     | null: false |
| nickname              | string     | null: false |
| encrypted_password    | string     | null: false |
| birthday              | string     | null: false |

### Association

* has_many :items
* has_many :records

## items table

| Column            | Type        | Options     |
|-------------------|-------------|-------------|
| image             |             | null: false |
| name              | string      | null: false |
| description       | text        | null: false |
| category          | text        | null: false |
| status            | text        | null: false |
| shipping_charge   | string      | null: false |
| shipping_area     | string      | null: false |
| day_to_ship       | string      | null: false |
| price             | string      | null: false |
| comment           | text        | null: false |

### Association

* belongs_to :informations
* has_one :records

## records table

| Column          | Type      | Options     |
|-----------------|-----------|-------------|
| date_and_time   | string    | null: false |

### Asspcoation

* belongs_to : users
* has_one :items

## information table

| Column        | Type    | Options     |
|---------------|---------|-------------|
| postal_code   | string  | null: false |
| prefecture    | string  | null: false |
| municipality  | string  | null: false |
| house_number  | string  | null: false |
| building      | string  |             |
| phone_number  | string  | null: false |