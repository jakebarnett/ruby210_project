FactoryGirl.define do
    factory :project do
        name                { Faker::App.name }
        description         { Faker::Company.catch_phrase }
    end
end