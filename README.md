# README
## users テーブル

| Column               | Type   | Options                   |
| ---------------------| ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| password_confirmation| string | null: false               |
| last-name            | string | null: false               |
| first-name           | string | null: false               |
| last-name-kana       | string | null: false               |
| first-name-kana      | string | null: false               |
| birth-date           | date   | null: false               |

### Association

* has_many :items
* has_many :orders
* has_many :comments, through: items

## items テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| item-name    | string     | null: false                    |
| item-info    | text       | null: false                    |
| item-category| integer    | null: false                    |
| item-status  | integer    | null: false                    |
| option       | integer    | null: false                    |
| area         | integer    | null: false                    |
| schedule     | integer    | null: false                    |
| item-price   | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

* belongs_to :user
* has_many :comments
* has_one :order

## comments テーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| comment-text| text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item


## orders テーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item
* has_one :shopping-address


## shopping-addresses テーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| postal-code | string     | null: false                    |
| prefecture  | integer    | null: false                    |
| city        | string     | null: false                    |
| addresses   | string     | null: false                    |
| building    | string     |                                |
| phone-number| string     | null: false                    |
| order       | references | null: false, foreign_key: true |

### Association

* belongs_to :order
