## products table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|integer(enum)|null: false|
|price|integer|null: false|
|detail|text||
|condition|integer(enum)|null: false|
|size|integer(enum)||
|days|integer(enum)|null: false|
|method|integer(enum)|null: false|
|fee|integer(enum)|null: false|
|buyer_id|integer|null: false|
|prefecture_id|integer(enum)|null: false|


### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- has_many :likes, dependent: :destroy
- has_many :images, dependent: :destroy


## categories table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||


### Association
- has_many :products
- has_ancestry


## likes table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product


## cards table

|Column|Type|Options|
|------|----|-------|
|card_id|integer|null: false|
|buyer_id|integer|null: false|
|user_id|references|null: false, foreign_key:true|

### Association
- belongs_to :user


## comments table

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product


## addresses table

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id(acitve_hash)|integer|null: false|
|city|string|null: false|
|block|string|null: false|
|apartment|string||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## users table
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|phone|string|null: false, unique: true|
|password|string|null: false|
|icon|string|null: false|
|profile|text||

### Association
- has_many :products, dependent: :destroy
- has_many :cards, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_one :addresses, dependent: :destroy
- has_many :likes, dependent: :destroy

## images table
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product
