FactoryGirl.define do
  factory :comment do
    body "This is a great comment"
    user
    commentable_id 1
    commentable_type "Post"
    commentable_parent 1
  end

  factory :user_with_comments do
    transient do
      post_count 5
    end

    after(:create) do |user, evaluator|
      create_list(:comment, evaluator.comments_count, user: user)
    end
  end

end
