require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '購入できる場合' do
      it '全ての値が存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'post_codeが空では購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecture_idが空では購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phonenumberが空では購入できない' do
        @order_address.phonenumber = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it 'post_codeにハイフンが含まれていないと購入できない' do
        @order_address.post_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが全角だと購入できない' do
        @order_address.post_code = '１２３−４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'phonenumberが9桁以下では購入できない' do
        @order_address.phonenumber = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phonenumber is invalid")
      end
      it 'phonenumberが10桁以上11桁以内でないと購入できない' do
        @order_address.phonenumber = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phonenumber is invalid")
      end
      it 'phonenumberが全角だと購入できない' do
        @order_address.phonenumber = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phonenumber is invalid")
      end
      it 'tokenが空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
