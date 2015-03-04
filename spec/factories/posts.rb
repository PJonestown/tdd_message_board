FactoryGirl.define do
  factory :post do
    title           "A great great title"
    body            "Big ol body"
    user_id         1
  end

  factory :invalid_post, parent: :post do |f|
    f.title         nil
  end

  factory :updated_post, parent: :post do |f|
    f.title         'New Title'
  end
end
