FactoryBot.define do

  factory :user do
    family_name              {"abe"}
    first_name              {"abe"}
    family_name_kana          {"カタカナ"}
    first_name_kana           {"カタカナ"}
    birthday                  {"20200101"}
    nickname              {"abe"}
    phone                  {"00000000000"}
    email                 {"kkk@gmail.com"}
    password               {"0000000"}
    password_confirmation  {"0000000"}
    icon              {"abe"}
    profile              {"abe"}
  end

end