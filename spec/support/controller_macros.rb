module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')
      sign_in @user
    end
  end
end
