require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname,email,password,password_confirmation,last_name,first_name,last_name_reading,first_name_reading,birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailは、@を含まないと登録できない" do
      @user.email = "email.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "重複したemailが存在する場合は登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが6文字以上の場合は登録できる" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      expect(@user).to be_valid
    end
    
    it "passwordが5文字以下の場合は登録できない" do
      @user.password = "123ab"
      @user.password_confirmation = "123ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it "passwordが数字のみ場合は登録できない" do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "passwordが英字のみ場合は登録できない" do
      @user.password = "abcdefg"
      @user.password_confirmation = "abcdefg"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "passwordが全角の場合は登録できない" do
      @user.password = "１２３ａｂｃ"
      @user.password_confirmation = "１２３ａｂｃ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = "123abc"
      @user.password_confirmation = "1234abcd"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordは確認用含めて、2回入力しないと登録できない" do
      @user.password = "123abc"
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "名字(last_name)が空だと登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "名字(last_name)が半角だと登録できない" do
      @user.last_name = "ﾊﾝｶｸ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end

    it "名前(first_name)が空だと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "名前(first_name)が半角だと登録できない" do
      @user.first_name = "ﾊﾝｶｸ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end

    it "名字のフリガナ(last_name_reading)が空だと登録できない" do
      @user.last_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank")
    end

    it "名字のフリガナ(last_name_reading)が半角カタカナだと登録できない" do
      @user.last_name_reading = "ﾊﾝｶｸ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading Full-width katakana characters")
    end

    it "名前のフリガナ(first_name_reading)が空だと登録できない" do
      @user.first_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end

    it "名前のフリガナ(first_name_reading)が半角カタカナだと登録できない" do
      @user.first_name_reading = "ﾊﾝｶｸ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading Full-width katakana characters")
    end

    it "birthdayが空だと登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
