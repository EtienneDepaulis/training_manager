FactoryGirl.define do
  factory :user do
    association             :group
    sequence(:name)  		    {|i| "user ##{i}"}
    sequence(:email)        {|i| "user-#{i}@gmail.com"}
  end

  factory :group do
  	sequence(:name)  		    {|i| "group ##{i}"}
  end

  factory :location do
  	sequence(:name)  		    {|i| "location ##{i}"}
  end

  factory :training_session do
    association             :location
    sequence(:description)  {|i| "training_session ##{i}"}
    started_at              Date.today
  end

  factory :allowance do
    association             :group
    association             :training_session
  end

  factory :invitation do
    association             :user
    association             :training_session
    status                  "pending"
  end
end