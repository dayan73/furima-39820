require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'ニックネームが空では登録できない' do
      user = FactoryBot.build(:user, nickname: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end   
        
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = ''  # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end
    
    it 'メールアドレスに一意性がないと登録できない' do
      FactoryBot.create(:user, email: 'test@example.com')
    
      user = FactoryBot.build(:user, email: 'test@example.com')
      user.valid?
      expect(user.errors.full_messages).to include("Email has already been taken")
    end
    
    it 'メールアドレスに@がないと登録できない' do
      user = FactoryBot.build(:user, email: 'invalidemail.com')
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    
    it 'パスワードが空では登録できない' do
      user = FactoryBot.build(:user, password: nil, password_confirmation: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'パスワードは6文字以上でないと登録できない' do
      user = FactoryBot.build(:user, password: '12345', password_confirmation: '12345')
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it 'パスワードとパスワード（確認）の値が一致してないと登録できない' do
      user = FactoryBot.build(:user, password: 'password', password_confirmation: 'password123')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '姓が空では登録できない' do
      user = FactoryBot.build(:user, last_name: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it '名が空では登録できない' do
      user = FactoryBot.build(:user, first_name: nil)
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it '姓（フリガナ）が空では登録できない' do
      user = FactoryBot.build(:user, phonetic_last_name: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Phonetic last name can't be blank")
    end

    it '名（フリガナ）が空では登録できない' do
      user = FactoryBot.build(:user, phonetic_first_name: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Phonetic first name can't be blank")
    end

    it '誕生日が空では登録できない' do
      user = FactoryBot.build(:user, birthday: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end