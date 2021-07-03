require 'rails_helper'
# RSpec.describe Task, type: :model do
  describe 'タスクモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'タスクの名前が空の場合' do
        it 'バリデーションにひっかる' do
          task = Task.new(name: '', detail: '失敗テスト2')
          expect(task).not_to be_valid
        end
      end
  　　context 'タスクの詳細が空の場合' do
        it 'バリデーションにひっかかる' do
          # ここに内容を記載する
          task = Task.new(name:'失敗テスト1', detail:'')
          expect(task).not_to be_valid
        end
      end
      context 'タスクの名前と詳細に内容が記載されている場合' do
        it 'バリデーションが通る' do
          # ここに内容を記載する
          task = Task.new(name: '失敗テスト1', detail: '失敗テスト2')
          expect(tack).to be_valid
        end
      end
    end
  end
# end
