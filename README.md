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