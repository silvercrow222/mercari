FactoryBot.define do

  factory :address do
    postal_code     { "000-0000" }
    prefecture_id   { 1 }
    city            { "台東区" }
    block           { "浅草1-1-1" }
    apartment       { "浅草アパート101号室"}
  end

end