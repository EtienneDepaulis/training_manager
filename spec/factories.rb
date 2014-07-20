FactoryGirl.define do
  factory :user do
    sequence(:name)  		{|i| "user ##{i}"}
    sequence(:email)    {|i| "user-#{i}@gmail.com"}
    association 				:group
  end

  factory :group do
  	sequence(:name)  		{|i| "group ##{i}"}
  end

  factory :location do
  	sequence(:name)  		{|i| "location ##{i}"}
  end

  factory :training_session do
    association         :location
    sequence(:name)     {|i| "training_session ##{i}"}
    started_at          Date.today
  end
end