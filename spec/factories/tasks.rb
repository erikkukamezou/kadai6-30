# 「FactoryBotを使用します」という記述
FactoryBot.define do
  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task do
    name { 'test' }
    detail { 'foo' }
    status {'完了'}
    limit { '2021-07-01' }
    priority {'高'}
    association :user
  end
  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    name { 'test2' }
    detail { 'foo2' }
    status {'着手中'}
    limit {'2021-07-02'}
    priority {'中'}
    user_id { User.first.id }
    # association :user
  end

  factory :third_task, class: Task do
    name { 'test3' }
    detail { 'foo3' }
    status {'未着手'}
    limit {'2021-07-03'}
    priority {'低'}
    user_id { User.first.id }
    # association :user
  end


end
