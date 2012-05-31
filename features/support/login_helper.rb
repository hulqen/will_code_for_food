module LoginHelper
  def login(email, password)
    visit('/log_in')
    fill_in('email', :with => email)
    fill_in('password', :with => password)
    click_button('login')
  end
end

World(LoginHelper)