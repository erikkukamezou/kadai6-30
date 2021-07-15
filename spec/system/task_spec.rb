require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do

  # # background do
  # FactoryBot.create(:task, user: @user)
  # FactoryBot.create(:second_task, user: @user)
  let!(:task) { FactoryBot.create(:task) }
  let!(:second_task) { FactoryBot.create(:second_task) }
  let!(:third_task) { FactoryBot.create(:third_task) }

  before do
  # #   @task = FactoryBot.create(:task)
  # #   @task2 =FactoryBot.create(:second_task)
  # #   @user = FactoryBot.create(:user)
    visit new_session_path
    fill_in :session_email, with: 'test11@test.com'
    fill_in :session_password, with: 'testtest11'
    click_button "ログイン"
  #
    # visit tasks_path
  end
  # before do
  #     @task = FactoryBot.create(:task, title: 'task')
  #     @task = FactoryBot.create(:second_task, title: 'task2')
  #   end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do

        visit tasks_path
        visit new_task_path


        fill_in "task[name]", with: 'test'
        fill_in "task[detail]", with: 'foo'
        # fill_in "select", from: '完了'
        select '完了', from: "task[status]"
        # date '2021-07-02', from: "task[limit]"
        fill_in "task[limit]", with: '2021-07-01'
        select '高', from: "task[priority]"
        click_button '登録'
        expect(page).to have_content 'test'
        expect(page).to have_content 'foo'
        expect(page).to have_content '完了'
        expect(page).to have_content '2021-07-01'
        expect(page).to have_content '高'
       end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        # task = FactoryBot.create(:task, name: 'task')
        visit tasks_path
        expect(page).to have_content 'test'
        expect(page).to have_content 'foo'
        expect(page).to have_content '完了'
      end
    end
      # テスト内容を追加で記載する
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
         # ここに実装する
         # task = FactoryBot.create(:task, name: 'task')
         visit tasks_path
         task_list = all('.task_list')
         # test = task[0]
         # test2 = task[1]
         # test = task[2]
         # task.create
         expect(task_list[0]).to have_content 'test'
         expect(task_list[1]).to have_content 'test2'
         expect(task_list[2]).to have_content 'test3'
         # expect(Task.order("created_at DESC")).to ["test", "test2", "test3"]
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         # task = FactoryBot.create(:task)
         visit tasks_path(@task)
         expect(page).to have_content 'test'
         expect(page).to have_content 'foo'
         expect(page).to have_content '完了'
       end
     end
     context '終了期限でソートする場合' do
       it 'タスクが終了期限の降順に並んでいる' do
         visit tasks_path
         click_on '終了期限で並び替え'
         visit tasks_path(sort_limit: "true" )
         visit tasks_path
         task_row = all('.task_row')
         # test = task[0]
         # test2 = task[1]
         # test = task[2]

         expect(task_row[0]).to have_content '2021-07-03'
         expect(task_row[1]).to have_content '2021-07-01'
         expect(task_row[2]).to have_content '2021-07-02'
       end
     end
  end

  #
  describe '検索機能' do
    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit tasks_path
        # タスクの検索欄に検索ワードを入力する (例: task)
        fill_in "name", with: 'test'
        # 検索ボタンを押す
        click_button '探すよー'
        expect(page).to have_content 'test'
      end
    end
    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        visit tasks_path
        # ここに実装する
        select "完了", from: "status"
        click_button '探すよー'
        # プルダウンを選択する「select」について調べてみること
        expect(page).to have_content '完了'
      end
    end
    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        # ここに実装する
        visit tasks_path
        fill_in "name", with: 'test' and select "完了", from: "status"
        click_button '探すよー'
        expect(page).to have_content 'test'
        expect(page).to have_content '完了'
      end
    end
  end
end
