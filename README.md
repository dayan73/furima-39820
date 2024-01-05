# README

## usersテーブル

| Column             | Type      | Options                   |
| ------------------ | ----------| --------------------------|
| nickname           | text      | NOT NULL                  |
| email              | string    | NOT NULL,unique: true     |
| password           | text      | NOT NULL                  |
| last_name          | text      | NOT NULL                  |
| first_name         | text      | NOT NULL                  |
| phonetic_last name | text      | NOT NULL                  |
| phonetic_first name| text      | NOT NULL                  |
| birthday           | string    | NOT NULL,unique: true     |


## itemsテーブル

| Column             | Type      | Options                   |
| ------------------ | ----------| --------------------------|
| trade name         | text      | NOT NULL                  |
| description        | text      | NOT NULL                  |
| price              | string    | NOT NULL                  |
| states             | text      | NOT NULL                  |
| postage            | string    | NOT NULL                  |
| region             | text      | NOT NULL                  |
| days               | string    | NOT NULL                  |
| category           | text      | NOT NULL                  |
| foreign_key        | references| NOT NULL                  |

-	アソシエーション: has_one :purchase


