## users

| Column         | Type    | Options                   |
|----------------|---------|---------------------------|
| nickname       | string  | null: false               |
| email          | string  | null: false, unipue: true |
| password       | string  | null: false               |
| lastname       | string  | null: false               |
| firstname      | string  | null: false               |
| lastname_kana  | string  | null: false               |
| firstname_kana | string  | null: false               |
| birth-date     | integer | null: false               |

### Association
- has_many :items


## items

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| title       | string     | null: false                    |
| description | text       | null: false                    |
| category    | integer    | null: false                    |
| condition   | imteger    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## purchases

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one :address


## addresses

| Column        | Type   | Options                        |
|---------------|--------|--------------------------------|
| post-code     | string | null: false                    |
| prefecture    | string | null: false                    |
| city          | string | null: false                    |
| house-number  | string | null: false                    |
| building-name | string |                                |
| phonenumber   | string | null: false                    |

### Association
- belongs_to :purchase