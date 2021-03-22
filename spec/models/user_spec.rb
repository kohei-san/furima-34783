require 'rails_helper'

RSpec.describe User, type: :model do

  describe "ユーザー新規登録" do
    before do 
      @user = FactoryBot.build(:user)
    end
      context "ユーザー新規登録ができる場合" do
      it "全ての項目に入力したら、ユーザー登録ができる" do
        expect(@user).to be_valid
      end
    end

    context "ユーザー新規登録ができない場合" do
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
      it "メールアドレスは@が含まれないと登録できない" do
        @user.email = "testcom"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
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
      it "半角英数字のみでは登録できない" do
      @user.password = "abcdefg"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて半角で設定してください")
      end
      it "数字のみでは登録できない" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて半角で設定してください")
      end
      it "全角英数字混合では登録できない" do
      @user.password = "ａｂｃｄ１２"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて半角で設定してください")
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
      it "last_nameが「漢字、平仮名、カタカナ」以外では登録できない" do
        @user.last_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角の「ひらがな、カタカナ、漢字」で入力してください")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが「漢字、平仮名、カタカナ」以外では登録できない" do
        @user.first_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角の「ひらがな、カタカナ、漢字」で入力してください")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaがカタカナ以外では登録できない" do
        @user.last_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana は全角の「カタカナ」で入力してください")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaがカタカナ以外では登録できない" do
        @user.first_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は全角の「カタカナ」で入力してください")
      end
      it "生年月日が空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
