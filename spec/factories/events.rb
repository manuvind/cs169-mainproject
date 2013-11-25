FactoryGirl.define do
  factory :event do
    title "Volunteering"
    description "You volunteer"
    time Date.today
    #admin false
  end
end
