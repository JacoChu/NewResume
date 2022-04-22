# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # before do
  #   @user = FactoryBot.create(:user, password: "123456")
  # end

  let(:user) { FactoryBot.create(:user, password: '123456') }

  it 'username不能重複' do
    # Arrange
    username = 'kitty'
    FactoryBot.create(:user, username:)
    # Act
    u = FactoryBot.build(:user, username:)
    u.save
    # Assertion
    expect(u.errors.any?).to be true
  end

  it '使用者可以登入' do
    # Arrange

    # Act
    user_data = {
      account: user.username,
      password: '123456'
    }
    result = User.login(user_data)
    # Assertion
    expect(result.email).to eq user.email
  end

  it '註冊時密碼會加密' do
    expect(user.password).not_to be '123456'
  end
end
