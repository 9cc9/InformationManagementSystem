FactoryGirl.define do
  factory :student1, :class => :Student do
    name "nickname"
    email "ee@123.com"
    major "123"
    phone_number "123"
  end
  factory :student2, :class => :Student do
    name "nickname2"
    email "ee2@123.com"
    major "1232"
    phone_number "123"
  end

end

#FactoryGirl.define :student1 do |user|
#  user.name                  "Michael Hartl"
#  user.email                 "mhartl@example.com"
#  user.major                "foobar"
#  user.phone_number        "foobar"
#end