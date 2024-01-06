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

- has_one :purchase


## itemsテーブル

| Column             | Type      | Options                   |
| ------------------ | ----------| --------------------------|
| id                 | integer   | NOT NULL, primary key     |
| trade_name         | string    | NOT NULL                  |
| description        | text      | NOT NULL                  |
| price              | string    | NOT NULL                  |
| state_id           | integer   | NOT NULL                  |
| postage_id         | integer   | NOT NULL                  |
| region_id          | integer   | NOT NULL                  |
| day_id             | integer   | NOT NULL                  |
| category           | integer   | NOT NULL                  |
| purchase_id        | integer   | foreign key               |

-	has_one :purchase


## purchasesテーブル

| Column             | Type      | Options                   |
| ------------------ | ----------| ------------------------- |
| id                 | integer   | NOT NULL, primary key     |
| user               | references| NOT NULL foreign_key      |
| item               | references| NOT NULL foreign_key      |

- belongs_to :user 
- belongs_to :item


## addressesテーブル

| Column             | Type      | Options                   |
| ------------------ | ----------| ------------------------- |
| id                 | integer   | NOT NULL, primary key     |
| zip_code           | integer   | NOT NULL                  |
| city               | string    | NOT NULL                  |
| house_number       | integer   | NOT NULL                  |
| building           | integer   | NOT NULL                  |
| phone_number       | integer   | NOT NULL                  |
| purchase_id        | integer   | NOT NULL, foreign_key     |

- belongs_to :purchases