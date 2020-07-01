
##categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|category_upper|string|null: false|
|category_middle|string|null: false|
|category_lower|string|null: false|

### Association
- has_many : product_categories
- has_many : products,through: :product_categories

##brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products

##product_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :category

##likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product


## cardsテーブル

|Column|Type|Options|
|-----|----|-------|
|card_number|integer|null: false|
|card_month|integer|null: false|
|card_year|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key:true|

### Association
- belongs_to :user



## commentsテーブル

|Column|Type|Options|
|-----|----|-------|
|comment|text|null: false|
|user_id|references|null:false,  foreign_key:true|
|product_id|references|null: false,  foreign_key:true|

### Association
- belongs_to :user
- belongs_to :product



## addressesテーブル

|Column|Type|Options|
|-----|----|-------|
|postal_code|string|null: false|
|prefecture|string|null:false|
|city|string|null:false|
|address|string|null:false|
|apartment|string||
|user_id|references|null:false,  foreign_key:true|


### Association
- belongs_to :user

