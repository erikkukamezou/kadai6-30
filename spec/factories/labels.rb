FactoryBot.define do
  factory :label do
    id { 1 }
    name { '不合格' }
  end
  factory :second_label, class: Label do
    id { 2 }
    name { '仕事' }
  end
end
