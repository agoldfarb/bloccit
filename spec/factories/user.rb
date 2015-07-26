FactoryGirl.define do
  factory :user do
    name "John Doe"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now

    factory :user_with_post_and_comment do
      transient do
        new_comment = :comment
      end

      after(:build) do |user, evaluator|
        post = create(:post, user: user)
        comment = create(:comment, comment, user: user, post: post)
      end
    end
  end
end