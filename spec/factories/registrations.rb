FactoryGirl.define do
  factory :registration do
    user nil
    event nil
    status "MyString"
    price "9.99"
    guest_count 1
  end
end
