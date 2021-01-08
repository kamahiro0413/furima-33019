require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
 describe '商品購入機能' do
   before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @user_purchase = FactoryBot.build(:user_purchase, user_id:@user.id, item_id:@item.id)
    sleep 0.1
   end

   context '商品を購入できるとき' do

    it 'すべての値が正しく入力されていれば購入できる' do
     expect(@user_purchase).to be_valid
    end

    it 'building_nameが空でも購入できる' do
     @user_purchase.building_name = nil
     expect(@user_purchase).to be_valid
    end
   end

   context '商品が購入できないとき' do

    it 'postal_codeが空だと購入できない' do
      @user_purchase.postal_code = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeはハイフン(-)を含めないと購入できない' do
      @user_purchase.postal_code = "1234567"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it 'prefecture_idは空だと購入できない' do
      @user_purchase.prefecture_id = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefecture_idは未選択だと購入' do
      @user_purchase.prefecture_id = 1
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Prefecture Select")
    end

    it 'cityが空だと購入できない' do
      @user_purchase.city = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberが空だと購入できない' do
      @user_purchase.house_number = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone_numが空だと購入できない' do
      @user_purchase.phone_num = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone num can't be blank")
    end

    it 'phone_numは数字以外を含むと購入できない' do
      @user_purchase.phone_num = "090-123-456"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone num Input only number")
    end

    it 'phone_numは12桁以上だと購入できない' do
      @user_purchase.phone_num = "090123456789"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone num is too long (maximum is 11 characters)")
    end

    it 'tokenが空だと購入できない' do
      @user_purchase.token = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
    end   
   end
 end
end