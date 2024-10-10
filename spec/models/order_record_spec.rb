require 'rails_helper'

RSpec.describe OrderRecord, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_record = FactoryBot.build(:order_record, user_id: user.id, item_id: item.id)
    end  
  describe '商品購入機能' do
    context '商品を購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_record).to be_valid
      end
      
      it 'buildingは空でも購入できること' do
        @order_record.building = ''
        expect(@order_record).to be_valid
      end  
    
    end


    context '商品を購入できない場合' do
      it 'postalcodeが空では保存できないこと' do
        @order_record.postalcode = ''
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Postalcode can't be blank")
      end
    
      it 'postalcodeが半角のハイフンを含んだ形式でないと購入できない' do
        @order_record.postalcode = '1234567'
        @order_record.valid?
        
        expect(@order_record.errors.full_messages).to include("Postalcode is invalid. Include hyphen(-)")
      end
      
      it 'prefectureが空だと購入できない' do
        @order_record.prefecture_id = 1
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Prefecture can't be blank")
      end
      
      it 'cityが空だと購入できない' do
        @order_record.city = ''
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("City can't be blank")
      end
      
      it 'addressesが空だと購入できない' do
        @order_record.addresses = ''
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Addresses can't be blank")
      end  
    
      it 'phonenumberが空だと購入できない' do
        @order_record.phonenumber = ''
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it 'phonenumberが10文字未満なら購入できない' do
        @order_record.phonenumber = '123456789'
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Phonenumber is invalid.")
      end
      it 'phonenumberにハイフンが含まれると購入できない' do
        @order_record.phonenumber = '123-456-789'    
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Phonenumber is invalid.")
      end
      it 'phonenumberは半角数字でないと購入できない' do
        @order_record.phonenumber = '１２３４５６７８９０'
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Phonenumber is invalid.")
      end
      it 'phonenumberは12桁以上では保存できない' do
        @order_record.phonenumber = '012345678912'
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Phonenumber is invalid.")
      end
        
      it 'userが紐づいていないと購入できない' do
        @order_record.user_id = nil
        @order_record.valid?
        
        expect(@order_record.errors.full_messages).to include("User can't be blank")
      end
      
      it 'itemが紐づいていないと購入できない' do
        @order_record.item_id = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Item can't be blank")
      end              
      
      it "tokenが空では登録できないこと" do
        @order_record.token = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end