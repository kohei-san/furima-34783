require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "新規商品出品" do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
    end
    context "出品ができる場合" do
      it "出品が保存できる" do
        expect(@item).to be_valid
      end
    end

    context "出品ができない場合" do
      it "写真がなければ出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空なら出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが４０字以上なら出品できない" do
        @item.name = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it "infoが空なら出品できない" do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it "infoが1000字を超えると出品できない" do
        @item.info = "a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Info is too long (maximum is 1000 characters)")
      end
      it "categoryを選択していなければ出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を選択して下さい")
      end
      it "sales_statusを選択していなければ出品できない" do
        @item.sales_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status を選択して下さい")
      end
      it "shipping_feeを選択していなければ出品できない" do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee を選択して下さい")
      end
      it "prefectureを選択していなければ出品できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture を選択して下さい")
      end
      it "schedule_deliveryを選択していなければ出品できない" do
        @item.schedule_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule delivery を選択して下さい")
      end
      it "priceが空なら出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300円未満では出品できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300 ~ 9,999,999の半角で入力してください。")
      end
      it "priceが9999999円以上では出品できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300 ~ 9,999,999の半角で入力してください。")
      end
      it "priceが全角では出品できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300 ~ 9,999,999の半角で入力してください。")
      end
    end
  end
end
