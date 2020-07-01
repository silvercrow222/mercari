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
