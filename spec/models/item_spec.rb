require 'rails_helper'

RSpec.describe Item, type: :model do
  
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '正常な場合' do
      it '商品を出品できる' do
        expect(@item).to be_valid
      end
    end
    
    context '異常な場合' do
      it 'が1枚ないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.trade_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Trade name can't be blank")
      end

      it '商品の説明が空では登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end   

      it 'カテゴリーの情報が空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーが「---、メンズ、レディース、ベビー・キッズ、インテリア・住まい・小物、本・音楽・ゲーム、おもちゃ・ホビー・グッズ、家電・スマホ・カメラ、スポーツ・レジャー、ハンドメイド、その他」の11項目のいずれかでないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      
      it '商品の状態の情報が空では登録できない' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it '商品の状態は、「---、新品・未使用、未使用に近い、目立った傷や汚れなし、やや傷や汚れあり、傷や汚れあり、全体的に状態が悪い」の7項目のいずれかでないと登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end      
      
      it '配送料の負担が空では登録できない' do
        @item.postage_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it '商品の状態は、「---、着払い(購入者負担)、送料込み(出品者負担)」の3項目のいずれかでないと登録できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end  

      it '発送元の地域が空では登録できない' do
        @item.region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end

      it '発送元の地域は、「---」と47都道府県の合計48項目のいずれかでないと登録できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region must be other than 1")
      end 
      
      it '発送までの日数の情報が空では登録できない' do
        @item.transit_time_id  = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Transit time can't be blank")
      end

      it '発送までの日数の情報は、「---、1~2日で発送、2~3日で発送、4~7日で発送」の4項目のいずれかでないと登録できない' do
        @item.transit_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Transit time must be other than 1")
      end  

      it '価格の情報が空では登録できない' do
        @item.price  = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300から¥9,999,999の範囲で入力してください")
      
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300から¥9,999,999の範囲で入力してください")
      end
      
      it '価格は半角数値のみ保存可能であること' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end 
    end
  end         
end
