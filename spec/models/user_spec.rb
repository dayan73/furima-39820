require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '正常な場合' do
      it 'ユーザーを登録できる' do
        expect(@user).to be_valid
      end
    end

    context '異常な場合' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it 'メールアドレスに一意性がないと登録できない' do
        FactoryBot.create(:user, email: 'test@example.com')
        @user.email = 'test@example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      
      it 'メールアドレスに@がないと登録できない' do
        @user.email = 'invalidemail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'パスワードが空では登録できない' do
        @user.password = nil
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは6文字以上でないと登録できない'do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'パスワードとパスワード（確認）の値が一致していないと登録できない' do
        @user.password = 'password'
        @user.password_confirmation = 'password123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it ‘英字のみでは登録できない’ do
        @user.password = "password"
        @user.password_confirmation = "password"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      
      it ‘数字のみでは登録できない’ do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      
      it ‘全角だと登録できない’ do
        @user.password = "Ｐａｓｓｗｏｒｄ１２３"
        @user.password_confirmation = "Ｐａｓｓｗｏｒｄ１２３"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      
      it '姓に半角文字が含まれている場合は登録できない' do
        user = FactoryBot.build(:user, last_name: "Smith")
        user.valid?
        expect(user.errors.full_messages).to include("Last name is invalid")
      end
      
      it '名に半角文字が含まれている場合は登録できない' do
        user = FactoryBot.build(:user, first_name: "John")
        user.valid?
        expect(user.errors.full_messages).to include("First name is invalid")
      end
      
      it '姓（フリガナ）にひらがなが含まれている場合は登録できない' do
        user = FactoryBot.build(:user, phonetic_last_name: "やまだ")
        user.valid?
        expect(user.errors.full_messages).to include("Phonetic last name is invalid")
      end
      
      it '名（フリガナ）にひらがなが含まれている場合は登録できない' do
        user = FactoryBot.build(:user, phonetic_first_name: "たろう")
        user.valid?
        expect(user.errors.full_messages).to include("Phonetic first name is invalid")
      end
      
      it '姓（フリガナ）に漢字が含まれている場合は登録できない' do
        user = FactoryBot.build(:user, phonetic_last_name: "山田")
        user.valid?
        expect(user.errors.full_messages).to include("Phonetic last name is invalid")
      end
      
      it '名（フリガナ）に漢字が含まれている場合は登録できない' do
        user = FactoryBot.build(:user, phonetic_first_name: "太郎")
        user.valid?
        expect(user.errors.full_messages).to include("Phonetic first name is invalid")
      end
      
      it '誕生日が空では登録できない' do
        user = FactoryBot.build(:user, birthday: nil)
        user.valid?
        expect(user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end