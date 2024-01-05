# README

## usersテーブル

| Column             | Type      | Options                   |
| ------------------ | ----------| --------------------------|
| nickname           | text      | NOT NULL                  |
| email              | string    | NOT NULL,unique: true     |
| encrypted_password | string    | NOT NULL                  |
| last_name          | text      | NOT NULL                  |
| first_name         | text      | NOT NULL                  |
| phonetic_last name | text      | NOT NULL                  |
| phonetic_first name| text      | NOT NULL                  |
| birthday           | date      | NOT NULL,unique: true     |


## itemsテーブル

| Column             | Type      | Options                   |
| ------------------ | ----------| --------------------------|
| trade name         | string    | NOT NULL                  |
| description        | text      | NOT NULL                  |
| price              | string    | NOT NULL                  |
| states_id          | integer   | NOT NULL                  |
| postage_id         | integer   | NOT NULL                  |
| region_id          | integer   | NOT NULL                  |
| days_id            | integer   | NOT NULL                  |
| category           | integer   | NOT NULL                  |
| foreign_key        | references| null: false, foreign_key: true|

-	has_one :purchase


## purchasesテーブル

| Column             | Type      | Options                   |
| ------------------ | ----------| ------------------------- |
| id                 | text      | NOT NULL                  |
| user_id            | refarences| NOT NULL foreign_key: true|
| item_id            | refarences| NOT NULL foreign_key: true|

- belongs_to :user 
- belongs_to :item
