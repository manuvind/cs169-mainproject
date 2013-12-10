FactoryGirl.define do
  factory :event do
    title "Volunteering"
    description "You volunteer"
    active true
    time Date.today
    #admin false
  end
end
