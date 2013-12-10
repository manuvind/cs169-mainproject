FactoryGirl.define do
  factory :shift do
    title "Shift"
    description "You shift"
    sequence(:id) {|n| n}
    #admin false
  end
end
