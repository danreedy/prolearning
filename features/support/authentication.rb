module AuthenticationWorld
  def login_as_admin
    admin = FactoryGirl.create(:admin)
    visit new_user_session_path
    fill_in 'Password', :with => admin.password
    fill_in 'Email', :with => admin.email
    click_on 'Sign in'
  end
end

World(AuthenticationWorld)
