require 'rails_helper'
RSpec.describe 'ラベル管理機能', type: :system do
  before do
    @fourth_user = FactoryBot.create(:user)
    # # visit new_session_path
    # # fill_in "session[email]", with: "test1111@test.com"
    # # fill_in "session[password]", with: "testtest1111"
    # # click_button "ログイン"
    # @task = FactoryBot.create(:task)
    @label = FactoryBot.create(:label)
    @label2 = FactoryBot.create(:second_label)
  end

  describe 'ラベル管理・検索機能' do
    context 'タスク作成画面でラベルを選択した場合' do
      it 'ラベルが新規登録出来る' do
        visit new_session_path
        fill_in "session[email]", with: "test41@test.com"
        fill_in "session[password]", with: "testtest41"
        click_button "ログイン"
        visit new_task_path
        # fill_in "task_name", with: 'test2000'
        # fill_in "task[detail]", with: 'foo2000'
        # select '完了', from: "task[status]"
        # fill_in "task[limit]", with: '2021-07-08'
        # select '高', from: "task[priority]"
        fill_in "task_name", with: "test"
        fill_in "task_detail", with: "Factoryで作ったデフォルトのコンテント1"
        fill_in "task_limit", with: "2020-10-30"
        select "完了", from: "task_status"
        select "高", from: "task_priority"
        check "task_label_ids_1"
        # page.check(task_label_ids_1)
        click_button '登録'
        expect(page).to have_field '不合格'
    end

      it 'ラベルを解除できる' do
      visit new_session_path
      fill_in "session[email]", with: "test41@test.com"
      fill_in "session[password]", with: "testtest41"
      click_button "ログイン"
      visit tasks_path
      uncheck "task[label_ids]", with: '宿題'
      # all('tbody tr')[0].click_link '削除'
      expect(page).to have_content '更新しました!'
      # fill_in ''
      # click_button ''
      # expect(page).to have_content ''
      end
    end

    context 'ラベル検索をした場合' do
      it 'ラベル検索で絞り困れる' do
        visit new_session_path
        fill_in "session[email]", with: "test41@test.com"
        fill_in "session[password]", with: "testtest41"
        click_button "ログイン"
        visit tasks_path
        # check "label_id", with: '不合格'
        select '不合格', from: "task_label_id"
        click_button '探すよー'
        expect(page).to have_content '不合格'
      end
    end


  end


end
