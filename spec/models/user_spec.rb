require 'rails_helper'

RSpec.describe User, type: :model do

  describe "userモデル、バリデーションテスト" do
    before do 
      @user = FactoryBot.build(:user)
    end

    it "全ての項目に入力したら、ユーザー登録ができる" do
      expect(@user).to be_valid
    end
    it "ニックネームが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "ニックネームが重複していると登録できない" do
      @user.nickname = "aaa"
      @user.save
      @user = FactoryBot.build(:user)
      @user.nickname = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname has already been taken")
    end
    it "メールアドレスが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが重複していると登録できない" do
      @user.email = "test@com"
      @user.save
      @user = FactoryBot.build(:user)
      @user.email = "test@com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
    it "パスワードが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードが５文字以下では登録できない" do
      @user.password = "aaa11"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワード（確認）が空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワード（確認）がパスワードと一致していないと登録できない" do
      @user.password = "a12345"
      @user.password_confirmation = "b12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "生年月日が空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
