# README

usersテーブル

| Column             | Type      | Options                   |
| ------------------ | ----------| --------------------------|
| id                 | text      | NOT NULL                  |
| nickname           | text      | NOT NULL                  |
| email              | string    | NOT NULL,unique: true     |
| passward           | text      | NOT NULL                  |
| adress             | text      | NOT NULL                  |



itemsテーブル

| Column             | Type      | Options                   |
| ------------------ | ----------| --------------------------|
| name               | string    | NOT NULL                  |
| description        | text      | NOT NULL                  |
| price              | text      | NOT NULL                  |
| states             | text      | NOT NULL                  |


purchasesテーブル

| Column             | Type      | Options                   |
| ------------------ | ----------| ------------------------- |
| id                 | text      | NOT NULL                  |
| users_id           | refarences| NOT NULL foreign_key: true|
| item_id            | refarences| NOT NULL foreign_key: true|

