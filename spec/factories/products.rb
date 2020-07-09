FactoryBot.define do

  factory :product do
    name                  {"sample"}
    detail                {"Lorem"}
    price                 {500}
    condition             {"新品・未使用"}
    size                  {"L"}
    day                   {"1~2日で発送"}
    shipping              {"メルカリ便"}
    fee                   {"送料込み（出品者負担)"}
    brand_id              {"シャネル"}
    prefecture_id         {"東京都"}
    user
  end

end