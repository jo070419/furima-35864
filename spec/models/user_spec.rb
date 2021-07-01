require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'email,nickname,password,password_confirmation,last_name,first_name,ruby_last_name,ruby_first_name,birthdayが存在すれば登録できる' do
       expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "ruby_last_nameが空だと登録できない" do
        @user.ruby_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Ruby last name is invalid. Input full-width katakana characters.")
      end
      it "ruby_first_nameが空だと登録できない" do
        @user.ruby_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Ruby last name is invalid. Input full-width katakana characters.")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは、@を含んでいないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'ab1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameは漢字、ひらがな、カタカナ以外の文字を含んでいると登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'first_nameは漢字、ひらがな、カタカナ以外の文字を含んでいると登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'ruby_last_nameはカタカナ以外の文字を含んでいると登録できない' do
        @user.ruby_last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Ruby last name is invalid. Input full-width katakana characters.")
      end
      it 'ruby_first_nameはカタカナ以外の文字を含んでいると登録できない' do
        @user.ruby_first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Ruby first name is invalid. Input full-width katakana characters.")
      end
      it 'passwordが半角数字のみだと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
      it 'パスワードが半角英字のみだと登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
      it 'パスワードが全角英数字混合だと登録できないこと' do
        @user.password = '１１１ＡＡＡ'
        @user.password_confirmation = '１１１ＡＡＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
    end
  end
end
