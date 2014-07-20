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
end