require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "商品購入時のアドレス入力" do
    before do
      @address = FactoryBot.build(:order_address)
    end

    context "購入ができるとき" do
      it "住所が全て入力されている" do
        expect(@address).to be_valid
      end
      it "buildingは空欄でも購入できる" do
        @address.building = ""
        expect(@address).to be_valid
      end
    end

    context "購入ができない時" do
      it "postal_codeが空では購入できない" do
        @address.postal_code = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが'３桁以上-４桁'では登録できない" do
        @address.postal_code = "1234-1234"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "postal_codeが'３桁以下-４桁'では登録できない" do
        @address.postal_code = "12-1234"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "postal_codeが'３桁-４桁以上'では登録できない" do
        @address.postal_code = "123-12345"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "postal_codeが'３桁-４桁以下'では登録できない" do
        @address.postal_code = "123-123"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "postal_codeに'-'が入っていなければ購入できない" do
        @address.postal_code = "1231234"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "prefectureが選択されていない(0)では購入できない" do
        @address.prefecture_id = 0
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture must be selected")
      end
      it "cityが入力されていなければ購入できない" do
        @address.city = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it "addressが入力されていなければ購入できない" do
        @address.address = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では購入できない" do
        @address.phone_number = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが12桁以上では購入できない" do
        @address.phone_number = "123456789012"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "phone_numberが英数混合では購入できない" do
        @address.phone_number = "abcdefg1"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is not a number")
      end
      it "phone_numberが全角数字では購入できない" do
        @address.phone_number = "１２３４５６７８９"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is not a number")
      end
      it "user_idが空では購入できない" do
        @address.user_id = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では購入できない" do
        @address.item_id = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では購入できない" do
        @address.token = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Token (submit card information properly)")
      end
    end
  end
end
