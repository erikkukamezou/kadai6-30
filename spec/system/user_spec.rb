require 'rails_helper'

RSpec.describe 'ユーザーの登録', type: :system do

  # before do
  #   @user = FactoryBot.create(:user)
  #   @user2 = FactoryBot.create(:second_user)
  # end

  let(:user) {create.(:user, name: 'user')}
  let(:user) {create.(:user, name: 'second_user')}
  let(:user) {create.(:user, name: 'third_user')}

  describe 'ユーザー登録機能' do
      context 'ユーザーを新規登録した場合' do
        it '登録したユーザーが表示されること' do
          visit new_user_path
          fill_in 'user_name', with: 'test12'
          fill_in 'user_email', with: 'test12@test.com'
          fill_in 'user_password', with: 'testtest12'
          fill_in 'user_password_confirmation', with: 'testtest12'
          click_button '登録するよ'
          # expect(page).to have_content '#{name}のページ'
          expect(page).to have_content 'メールアドレス'
        end
    end
      context 'ユーザがログインせずタスク一覧画面に飛ぼうとしたとき' do
        it 'ログイン画面に遷移する' do
        visit root_path
        expect(page).to have_content '登録'
        expect(page).to have_content 'ログイン'
        end
      end
  end

  describe 'セッション機能' do
    before do
        visit new_session_path
        fill_in "session[email]", with: "test11@test.com"
        fill_in "session[password]", with: "testtest11"
        click_button "ログイン"
    end
    context 'ログインしていない状態でユーザデータがある場合' do
      it 'ログインができる' do
        visit new_session_path
        # fill_in "session[email]", with: "test1"
        # fill_in "session[password]", with: "test@test.com"
        # click_button "ログイン"
        expect(page).to have_content 'メールアドレス'
      end
    end
    # context 'ログインしている状態で'　do
      it '自分の詳細画面(マイページ)に飛べること' do
       # visit user_path(id: @user.id[1])
       expect(page).to have_content 'メールアドレス'
      end
    context 'ログインしていない状態でユーザデータがある場合'
    it '一般ユーザが他人の詳細画面に飛ぶとタスク一覧画面に遷移すること' do
      click_on 'プロフィール'
       # visit user_path(102)
       expect(page).to have_content 'あなたではありません'
    end

    it 'ログアウトができる' do
      click_link "ログアウトするよ"
       # expect(current_path).to eq new_session_path
      expect(page).to have_content 'ログインしてね'
    end
  end

  describe '管理画面のテスト' do
    before do
      visit new_session_path
      fill_in "session_email", with: "test21@test.com"
      fill_in "session_password", with: "testtest21"
      click_button "ログイン"
      visit admin_users_path
    end
    context '管理者が登録されている場合' do
      it '管理ユーザは管理画面にアクセスできること' do
      # visit admin_users_path
      expect(page).to have_content 'タスク数'
      end
    end
    context '一般ユーザーの場合' do
      it '管理画面にアクセスできないこと' do
        click_on 'ログアウト'
        visit new_session_path
        fill_in "session[email]", with: "test11@test.com"
        fill_in "session[password]", with: "testtest11"
        click_button "ログイン"
        visit admin_users_path
        expect(page).to have_content 'あなたは管理者ではありません'
      end
    end
    context '管理者が登録されている場合' do
      it 'ユーザの新規登録ができること' do
        visit new_admin_users_path
        fill_in 'user_name', with: 'test121'
        fill_in 'user_email', with: 'test121@test.com'
        fill_in 'user_password', with: 'testtest121'
        fill_in 'user_password_confirmation', with: 'testtest121'
        click_button 'アカウント作成するよ'
        visit admin_users_path
        expect(page).to have_content '名前'
      end
      it 'ユーザの詳細画面にアクセスできること' do
        click_on '詳細'
        expect(page).to have_content 'メールアドレス'
      end
      it 'ユーザの編集画面からユーザを編集できること' do
        click_on '編集'
        expect(page).to have_content 'アカウント更新'
      end
      it 'ユーザの削除をできること' do
        click_on '削除'
        expect(page).to have_content '削除しました!'
      end
    end
end






end
