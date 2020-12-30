require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'image,item_name,explanation,category_id,condition_id,shipping_cost_id,prefecture_id,days_to_ship_id,priceが存在すれば登録できる' do
      expect(@item).to be_valid
    end

    it 'imageが空だと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'item_nameが空だと保存できない' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it 'explanationが空だと保存できない' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'category_idがデフォルト(id:1)だと保存できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end

    it 'category_idが空だと保存できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'condition_idがデフォルト(id:1)だと保存できない' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
    end

    it 'condition_idが空だと保存できない' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    
    
    it 'shipping_cost_idがデフォルト(id:1)だと保存できない' do
      @item.shipping_cost_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping cost Select')
    end

    it 'shipping_cost_idが空だと保存できない' do
      @item.shipping_cost_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
    end
    
    
    it 'prefecture_idがデフォルト(id:1)だと保存できない' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end

    it 'prefecture_idが空だと保存できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    
    it 'days_to_ship_idがデフォルト(id:1)だと保存できない' do
      @item.days_to_ship_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to ship Select')
    end

    it 'days_to_ship_idが空だと保存できない' do
      @item.days_to_ship_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
    end
    
    it 'priceが空だと保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300より小さい場合は保存できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it 'priceが9,999,999より大きい場合は保存できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it 'priceが全角数字だと保存できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end
  end
end
