# README

## usersテーブル

| Column             | Type      | Options                   |
| ------------------ | ----------| --------------------------|
| nickname           | string    | NOT NULL                  |
| email              | string    | NOT NULL,unique: true     |
| encrypted_password | string    | NOT NULL                  |
| last_name          | string    | NOT NULL                  |
| first_name         | string    | NOT NULL                  |
| phonetic_last_name | string    | NOT NULL                  |
| phonetic_first_name| string    | NOT NULL                  |
| birthday           | date      | NOT NULL,unique: true     |

- has_many :purchase
- has_many :item

## itemsテーブル

| Column             | Type      | Options                   |
| ------------------ | ----------| --------------------------|
| id                 | integer   | NOT NULL, primary key     |
| trade_name         | string    | NOT NULL                  |
| description        | text      | NOT NULL                  |
| price              | integer   | NOT NULL                  |
| state_id           | integer   | NOT NULL                  |
| postage_id         | integer   | NOT NULL                  |
| region_id          | integer   | NOT NULL                  |
| transit_time_id    | integer   | NOT NULL                  |
| category_id        | integer   | NOT NULL                  |
| user               | references| NOT NULL, foreign key     |

-	belongs_to :user
-	has_one :purchase


## purchasesテーブル

| Column             | Type      | Options                   |
| ------------------ | ----------| ------------------------- |
| user               | references| NOT NULL foreign_key      |
| item               | references| NOT NULL foreign_key      |

- belongs_to :user 
- belongs_to :item
-	has_one :address


## addressテーブル

| Column             | Type      | Options                   |
| ------------------ | ----------| ------------------------- |
| zip_code           | string    | NOT NULL                  |
| region_id          | integer   | NOT NULL                  |
| city               | string    | NOT NULL                  |
| house_number       | integer   | NOT NULL                  |
| building           | string    |                           |
| phone_number       | string    | NOT NULL                  |
| purchase           | references| NOT NULL, foreign_key     |

- belongs_to :purchase