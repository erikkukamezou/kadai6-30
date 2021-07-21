require 'rails_helper'

RSpec.describe 'ユーザーの登録', type: :system do

  # before do
  #   @user = FactoryBot.create(:user)
  #   @user2 = FactoryBot.create(:second_user)
  #   @user = FactoryBot.create(:third_user)
  # end

  # let(:user) {FactoryBot.create.(:user)}
  # let(:second_user) {FactoryBot.create.(:second_user)}
  # let(:third_user) {FactoryBot.create.(:third_user)}

  describe 'ユーザー登録機能' do
      context 'ユーザーを新規登録した場合' do
        it '登録したユーザーが表示されること' do
          visit new_user_path
          fill_in 'user[name]', with: 'test12'
          fill_in 'user[email]', with: 'test12@test.com'
          fill_in 'user[password]', with: 'testtest12'
          fill_in 'user[password_confirmation]', with: 'testtest12'
          click_button '登録するよ'
          visit new_session_path
          fill_in "session[email]", with: "test12@test.com"
          fill_in "session[password]", with: "testtest12"
          click_button 'ログイン'
          # expect(page).to have_content '#{name}のページ'
          expect(page).to have_content 'test12@test.com'
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
      # user1 = FactoryBot.create.(:user)

        @user = FactoryBot.create(:user)
        @user2 = FactoryBot.create(:second_user)
        @user3 = FactoryBot.create(:third_user)

        # visit new_session_path
        # fill_in "session[email]", with: "test11@test.com"
        # fill_in "session[password]", with: "testtest11"
        #
        # click_button "ログイン"

        # let(:user) {FactoryBot.create.(:user)}
        # let(:second_user) {FactoryBot.create.(:second_user)}
        # let(:third_user) {FactoryBot.create.(:third_user)}

    end
    context 'ユーザーが登録されている場合' do
      it 'ログインができる' do
        # user = FactoryBot.create.(:user)
        visit new_session_path
        fill_in "session[email]", with: "test11@test.com"
        fill_in "session[password]", with: "testtest11"
        click_button "ログイン"
        # visit user_path(100)
        # expect(page).to have_content 'test11@test.com'
        expect(current_path).to eq user_path(id: @user.id)
        # expect(current_path).to eq user_path(100)
      end

    # context 'ログインしている状態で' do
      it '自分の詳細画面(マイページ)に飛べること' do
       # visit user_path(id: @user.id[1])
        # expect(page).to have_content 'test11@test.com'
        visit new_session_path
        fill_in "session[email]", with: "test11@test.com"
        fill_in "session[password]", with: "testtest11"
        click_button "ログイン"
        visit user_path(id: @user.id)
        expect(current_path).to eq user_path(id: @user.id)

      end
    # context 'ログインしていない状態でユーザデータがある場合' do
      it '他人の詳細画面(マイページ)に飛ぶとタスク一覧画面に遷移すること' do
      # click_link 'マイページ'
      # find('a', text: 'プロフィール').click
       # visit user_path(102)
       visit new_session_path
       fill_in "session[email]", with: "test11@test.com"
       fill_in "session[password]", with: "testtest11"
       click_button "ログイン"
       visit user_path(id: @user2.id)
       expect(page).to have_content 'あなたではありません'
      end

      it 'ログアウトができる' do
        visit new_session_path
        fill_in "session[email]", with: "test11@test.com"
        fill_in "session[password]", with: "testtest11"
        click_button "ログイン"
        visit user_path(id: @user.id)
        click_link "ログアウトするよ"
         # expect(current_path).to eq new_session_path
        expect(page).to have_content 'ログインしてね'

      end
    end
  end

  describe '管理画面のテスト' do
    before do
    #   visit new_session_path
    #   fill_in "session[email]", with: "test21@test.com"
    #   fill_in "session[password]", with: "testtest21"
    #   click_button "ログイン"
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:second_user)
    @user3 = FactoryBot.create(:third_user)
    #
    end
    context '管理者が登録されている場合' do
      it '管理ユーザは管理画面にアクセスできること' do
        visit new_session_path
        fill_in "session[email]", with: "test21@test.com"
        fill_in "session[password]", with: "testtest21"
        click_button "ログイン"
        visit admin_users_path
        # expect(page).to have_content 'ユーザー一覧'
        expect(current_path).to eq admin_users_path
      end
    end
    context '一般ユーザーの場合' do
      it '管理画面にアクセスできないこと' do
        # click_on 'ログアウト'
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
        visit new_session_path
        fill_in "session[email]", with: "test21@test.com"
        fill_in "session[password]", with: "testtest21"
        click_button "ログイン"
        visit new_admin_user_path
        fill_in "user[name]", with: "test121"
        fill_in 'user[email]', with: 'test121@test.com'
        fill_in 'user[password]', with: 'testtest121'
        fill_in 'user[password_confirmation]', with: 'testtest121'
        click_button 'アカウント作成するよ'
        visit admin_users_path
        expect(page).to have_content '名前'
      end
      it 'ユーザの詳細画面にアクセスできること' do
        visit new_session_path
        fill_in "session[email]", with: "test21@test.com"
        fill_in "session[password]", with: "testtest21"
        click_button "ログイン"
        visit admin_user_path(id: @user.id)
        # click_link '詳細', href: admin_user_path(@user.id)
        # click_link '詳細', match: :first
        # expect(current_path).to eq admin_user_path(@user.id)
        expect(page).to have_content "#{@user.name}のページ"
        # visit user_path(id: @user.id)
        # find(".button").click
        # expect(page).to have_link '詳細', href: '/admin/users/13?locale=ja'

        # <a href="/admin/users/13?locale=ja">詳細</a>
        # expect(page).to have_content 'メールアドレス'
        expect(page).to have_content 'メールアドレス'
      end
      it 'ユーザの編集画面からユーザを編集できること' do
        visit new_session_path
        fill_in "session[email]", with: "test21@test.com"
        fill_in "session[password]", with: "testtest21"
        click_button "ログイン"
        visit edit_admin_user_path(id: @user.id)
        # click_link '編集', href: edit_admin_user_path(@user.id)
        # click_link '編集', match: :first
        fill_in 'user[name]', with: 'test30'
        fill_in 'user[email]', with: 'test30@test.com'
        # fill_in 'user[password]', with: 'test33333333'
        # fill_in 'user[password_confirmation]', with: 'test33333333'
        click_button '更新するよ'
        expect(page).to have_content '更新しました'
      end
      it 'ユーザの削除をできること' do
        visit new_session_path
        fill_in "session[email]", with: "test21@test.com"
        fill_in "session[password]", with: "testtest21"
        click_button "ログイン"
        visit admin_users_path

        # click_link '削除', href: admin_user_path(@user.id)
        all('tbody tr')[0].click_link '削除'

        # page.driver.browser.switch_to.alert.accept

        expect(page).to have_content '削除しました!'
      end
    end
end






end
