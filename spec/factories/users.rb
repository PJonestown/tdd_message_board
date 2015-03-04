FactoryGirl.define do
  factory :user do

    email                     "user@example.com"
    password                  "foobarextra"
    password_confirmation     "foobarextra"
    
  end

  factory :invalid_user, parent: :user do

    email                     nil

  end

  factory :updated_user, parent: :user do

    email                     "new@email.com"

  end

end
