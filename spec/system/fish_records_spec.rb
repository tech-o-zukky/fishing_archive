require 'rails_helper'

RSpec.describe "新規投稿機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @fish_record = FactoryBot.build(:fish_record)
  end

  context '新規投稿の正常パターン' do
    it 'ログインしたユーザーは新規投稿ができる' do
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('投稿する')
      # 投稿ページに遷移する
      visit new_record_path
      # フォームに投稿内容を入力する
      fill_in 'fish_record_title', with: @fish_record.title
      fill_in 'fish_record_date', with: @fish_record.date
      select '東京都', from: 'fish_record[prefecture_id]'
      fill_in 'fish_record_area', with: @fish_record.area
      fill_in 'fish_record_place', with: @fish_record.place
      check('fish_record_timing1')
      fill_in 'fish_record_fish_name', with: @fish_record.fish_name, match: :first
      fill_in 'fish_record_fish_count', with: @fish_record.fish_count, match: :first
      fill_in 'record-info', with: @fish_record.content

      # 投稿するとRecordsモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Record.count }.by(1)
      # トップページへ遷移することを確認する
      expect(current_path).to eq root_path
      # トップページに先ほど投稿したタイトルが表示されていることを確認する
      expect(page).to have_content(@fish_record.title)
    end
  end

  context '新規投稿の異常パターン' do
    it 'ログインしていないユーザーは新規投稿ができない' do
      # 新規投稿ページへのリンクがないことを確認する
      expect(page).to have_no_content('投稿する')
      # 投稿ページに遷移する
      visit new_record_path
      # リダイレクトされログインページへ遷移することを確認する
      expect(current_path).to eq new_user_session_path
    end
  end

end
