require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント登録' do
    context 'コメント登録:正常系' do
      it '正しく入力されていれば登録できること' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント登録:異常系' do
      it 'comment_textが空では登録できない' do
        @comment.comment_text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment textを入力してください")
      end
    end
  end
end
