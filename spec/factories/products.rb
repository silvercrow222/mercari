FactoryBot.define do

  factory :product do
    name                  {"abc"}
    price                 {500}
    detail                {"example"}
    fee                   {"送料込み（出品者負担)"}
    condition             {"新品・未使用"}
    day                   {"1~2日で発送"}
    size                  {"XXS以下"}
    # method                {"メルカリ便"}
    brand_id              {"シャネル"}
    prefecture_id         {"東京都"}
    user_id               {1}
    status                {"出品中"}
  end

end