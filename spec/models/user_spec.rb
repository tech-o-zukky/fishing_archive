require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録:正常系' do
      it '全ての情報が正しく入力されていれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録:異常系 必須項目の確認' do
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
    end

    context '新規登録:異常系 メールアドレスの確認' do
      it 'emailは重複登録できない(一意性の確認)' do
        @user_a = FactoryBot.create(:user)  # 先に登録しておく
        @user.email = @user_a.email # 登録済みのemailを代入
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailは@が含まれてなければ登録できない' do
        @user.email = Faker::Lorem.characters(number: 10) # 適当な文字列代入
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
    end

    context '新規登録:異常系 パスワードの確認' do
      it 'passwordは6桁以下だと登録できない' do
        @user.password = 'abc12' # 5桁で入力
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordは半角英数字混合でないと登録できない(英字のみの場合)' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'passwordは半角英数字混合でないと登録できない(数字のみの場合)' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'passwordは半角英数字混合でないと登録できない(全角は登録できない確認)' do
        @user.password = '123456aｂ'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'passwordと確認用passwordが一致しなければ登録できない' do
        @user.password_confirmation = "#{@user.password}abc" # 確認用パスワードに「abc」の文字を追加
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end

  end
end
