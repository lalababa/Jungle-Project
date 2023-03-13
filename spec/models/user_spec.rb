RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new(name: "test",
                    email: "test@test.com",
                    password: "test12",
                    password_confirmation: "test12")
  end

  it "should user be valid" do
    expect(@user).to be_valid
  end

  it "should password same as digest password" do
    @user.password_confirmation = "123"
    expect(@user).to_not be_valid
    pp @user.errors.full_messages
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "should have minimum password of 6" do
    @user1 = User.new(name: "test",
                    email: "test@test.com",
                    password: "test",
                    password_confirmation: "test")
    expect(@user1).to_not be_valid
    pp @user1.errors.full_messages
    expect(@user1.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end 

  it "should return false if password is not correct" do
    @user = User.authenticate_with_credentials("afbiawbfaw",@password)
    expect(@user).to eql(nil)
  end 

  it "should return true if password is correct" do
    @user = User.authenticate_with_credentials("test12",@password)
    expect(@user).to eql(nil)
  end 

end