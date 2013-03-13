module AuthenticationWorld
  def login_as_admin
    admin = FactoryGirl.create(:admin)
    visit new_user_session_path
    fill_in 'Password', :with => admin.password
    fill_in 'Email', :with => admin.email
    click_on 'Sign in'
  end

  def login_as_teacher
    teacher = FactoryGirl.create(:teacher)
    visit new_user_session_path
    fill_in 'Password', :with => teacher.password
    fill_in 'Email', :with => teacher.email
    click_on 'Sign in'
  end

  def login_as_observer
    observer = FactoryGirl.create(:observer)
    visit new_user_session_path
    fill_in 'Password', :with => observer.password
    fill_in 'Email', :with => observer.email
    click_on 'Sign in'
  end
end

World(AuthenticationWorld)
