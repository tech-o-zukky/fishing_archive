require 'rails_helper'

RSpec.describe FishRecord, type: :model do
  before do
    @fish_record = FactoryBot.build(:fish_record)
  end

  context '新規投稿:正常系' do
    it '必要な情報を適切に入力すると、登録ができること' do
      expect(@fish_record).to be_valid
    end
  end

  context '新規登録:異常系 必須項目の確認' do
    it 'titleが空では登録できない' do
      @fish_record.title = nil
      @fish_record.valid?
      expect(@fish_record.errors.full_messages).to include("errorタイトルを入力してください")
    end
    it 'dateが空では登録できない' do
      @fish_record.date = nil
      @fish_record.valid?
      expect(@fish_record.errors.full_messages).to include("釣行日を入力してください")
    end
    it 'prefecture_idが空では登録できない' do
      @fish_record.prefecture_id = nil
      @fish_record.valid?
      expect(@fish_record.errors.full_messages).to include("都道府県を入力してください")
    end
    it 'contentが空では登録できない' do
      @fish_record.content = ""
      @fish_record.valid?
      expect(@fish_record.errors.full_messages).to include("投稿内容を入力してください")
    end
  end
end
