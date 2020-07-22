[![GitHub issues](https://img.shields.io/github/issues/akioyokota/mercari)](https://github.com/akioyokota/mercari/issues)
[![GitHub forks](https://img.shields.io/github/forks/akioyokota/mercari)](https://github.com/akioyokota/mercari/network)
[![GitHub stars](https://img.shields.io/github/stars/akioyokota/mercari)](https://github.com/akioyokota/mercari/stargazers)


# What
We are making clone of Free Market site.

# FURIMA
You can check this app on <a href="http://52.192.240.140/">AWS!</a>
Please search for it on the internet.

# About
This app is clone site. You cannot actually buy ptoducts. But the basic systems has been reproduced! So please make an index of our technical level with it.

<img width="1406" alt="screen1" src="https://user-images.githubusercontent.com/66178755/88137414-73180900-cc26-11ea-9ee4-4f55b4b7e51d.png">

# Technology used
This application uses the following open source packages:



# Database
## products table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|price|integer|null: false|
|condition|integer(enum)|null: false|
|size|integer(enum)||
|day|integer(enum)|null: false|
|shipping|integer(enum)|null: false|
|fee|integer(enum)|null: false|
|prefecture_id|integer|null: false|
|brand_id|integer|null: false|
|buyer_id|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images, allow_destroy: true


## categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :products
- has_ancestry


## cards table
|Column|Type|Options|
|------|----|-------|
|card_id|string|null: false|
|customer_id|string|null: false|
|user_id|references|null: false, foreign_key:true|

### Association
- belongs_to :user


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
- belongs_to :user, optional: true
- belongs_to_active_hash :prefecture


## users table
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|phone|string|null: false, unique: true|
|encrypted_password|string|null: false|
|icon|string|null: false|
|profile|text||

### Association
- has_many :products, dependent: :destroy
- has_one :address, dependent: :destroy
- has_one :card, dependent: :destroy


## images table
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product
