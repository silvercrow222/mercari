##categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|category_upper|string|null: false|
|category_middle|string|null: false|
|category_lower|string|null: false|

### Association
- has_many : products_categories
- has_many : products,through: :products_categories

##brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- has_many :product

##products_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :category

##likeテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :users
- belongs_to :products
