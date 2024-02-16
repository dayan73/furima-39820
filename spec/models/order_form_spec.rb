require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '商品購入の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id )
    end

    context '正常な場合' do
      it 'tokenがあれば商品を購入できる' do
        expect(@order_form).to be_valid
      end
    end
  
    context '異常な場合' do
      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
            
      it '配送先の住所情報は購入の都度入力しないと登録できない' do
        @order_form.house_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("House number can't be blank")
      end

      it '郵便番号が空では登録できない' do
        @order_form.zip_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Zip code can't be blank")
      end

      it '郵便番号が「3桁ハイフン4桁」の半角文字列ではない場合は登録できない' do
        @order_form.zip_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end

      it '都道府県の情報が空では登録できない' do
        @order_form.region_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Region can't be blank")
      end

      it '市区町村の情報が空では登録できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
  
      it '番地の情報が空では登録できない' do
        @order_form.house_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("House number can't be blank")
      end
  
      it '電話番号の情報が空では登録できない' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
  
      it '電話番号が9桁以下では登録できない' do
        @order_form.phone_number = "123456789"  # 9桁の半角数値
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が12桁以上では登録できない' do
        @order_form.phone_number = "123456789012"  # 12桁の半角数値
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号に半角数字以外が含まれている場合、登録できない' do
        @order_form.phone_number = "1234567890a"  # 半角数値と半角英字
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it 'userが紐づいていないと出品できないこと' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが紐づいていないと出品できないこと' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank") 
      end 
    end
  end
end
