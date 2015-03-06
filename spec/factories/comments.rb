FactoryGirl.define do
  factory :comment do
    body "MyString"
user nil
commentable_id 1
commentable_type "MyString"
commentable_parent 1
  end

end
