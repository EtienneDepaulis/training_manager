FactoryGirl.define do
  factory :user do
    sequence(:name)  		{|i| "Utilisateur ##{i}"}
    sequence(:email)    {|i| "utilisateur-#{i}@gmail.com"}
  end
end