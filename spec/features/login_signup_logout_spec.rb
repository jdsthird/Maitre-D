require 'rails_helper'
require 'capybara/rails'

feature "Logging in" do
  background do
    User.create(:username => 'exampleuser', :password => 'password')
  end

  scenario "Logging in with correct credentials" do
    visit '/login'
    within("#login-form") do
      fill_in 'Username', :with => 'exampleuser'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Login'
    expect(page).to have_content 'My Events'
  end

  given(:other_user) { User.create(:username => 'otheruser', :password => 'something') }

  scenario "Logging in as another user" do
    visit '/login'
    within("#login-form") do
      fill_in 'Username', :with => other_user.username
      fill_in 'Password', :with => other_user.password
    end
    click_button 'Login'
    expect(page).to have_content 'Invalid username or password'
  end
end