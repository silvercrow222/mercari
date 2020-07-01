
## products table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, forign_key: true|
|name|string|null: false|
|image|string|null: false|
|category_id|integer|null: false, forign_key: true|
|brand_id|integer|null: false, forign_key: true|
|price|integer|null: false|
|detail|text||
|condition|string|null: false|
|size|string||
|days|string|null: false|
|method|string|null: false|
|fee|string|null: false|
|location|string|null: false|

### Association
- belongs_to :user
- belongs_to :brand
- has_many :categories, through: :product_categories
- has_many :product_categories


## categories table

|Column|Type|Options|
|------|----|-------|
|category_upper|string|null: false|
|category_middle|string|null: false|
|category_lower|string|null: false|

### Association
- has_many : product_categories
- has_many : products, through: :product_categories


## brands table

|Column|Type|Options|
|------|----|-------|
|brand_name|string|null: false|

### Association
- has_many :products


## product_categories table

|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :category


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
|-----|----|-------|
|card_number|integer|null: false|
|card_month|integer|null: false|
|card_year|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key:true|

### Association
- belongs_to :user


## comments table

|Column|Type|Options|
|-----|----|-------|
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
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|apartment|string||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## users table

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|myoji|string|null: false|
|namae|string|null: false|
|birthday|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|phone|string|null: false, unique: true|
|password|string|null: false|
|icon|string|null: false|
|profile|text||

### Association
- has_many :products
- has_many :cards
- has_many :comments
- has_many :addresses
