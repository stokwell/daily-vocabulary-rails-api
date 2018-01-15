FactoryGirl.define do
  factory :word do
    association :day
    to { %w(ru en de).sample }
    from { %w(ru en de).sample }
    original { FFaker::Food.fruit }
    translation { FFaker::Food.fruit }
    transcription { FFaker::Food.fruit }
  end
end
