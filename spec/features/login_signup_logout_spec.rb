require 'rails_helper'
require 'capybara/rails'

feature "Logging in" do
  background do
    User.create!(first_name: 'John', last_name: 'Doe', email: 'example@email.com', username: 'exampleuser', password: 'password')
  end

  scenario "with correct credentials" do
    visit '/login'
    within("#login-form") do
      fill_in 'Username', :with => 'exampleuser'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Login'
    expect(page).to have_content 'My Events'
  end

  given(:other_user) { User.create!(first_name: 'Jane', last_name: 'Doe', email: 'other@example.com', username: 'otheruser', password: 'something') }

  scenario "as another user" do
    visit '/login'
    within("#login-form") do
      fill_in 'Username', :with => other_user.username
      fill_in 'Password', :with => other_user.password
    end
    click_button 'Login'
    expect(page).to have_content 'Invalid username or password'
  end
end

feature "Logging out" do
  background do
    User.create!(first_name: 'John', last_name: 'Doe', email: 'example@email.com', username: 'exampleuser', password: 'password')
  end

  scenario "by clicking logout" do
    visit '/login'
    within("#login-form") do
      fill_in 'Username', :with => 'exampleuser'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Login'
    click_link 'Logout'
    expect(page).to have_content 'Login'
  end
end

feature "Signing up" do
  background do
    User.create!(first_name: 'John', last_name: 'Doe', email: 'example@email.com', username: 'exampleuser', password: 'password')
  end

  scenario "Signing up with unique username" do
    visit '/signup'
    within("#signup-form") do
      fill_in 'First name', with: 'Sally'
      fill_in 'Last name', with: 'Jones'
      fill_in 'Email', with: 'sally@jones.com'
      fill_in 'Username', with: 'sallyjones'
      fill_in 'Password', with: 'password'
    end
    click_button 'Register'
    expect(page).to have_content 'My Events'
  end

  scenario "Signing up with username that is taken" do
    visit '/signup'
    within("#signup-form") do
      fill_in 'First name', with: 'Sally'
      fill_in 'Last name', with: 'Jones'
      fill_in 'Email', with: 'sally@jones.com'
      fill_in 'Username', with: 'exampleuser'
      fill_in 'Password', with: 'password'
    end
    click_button 'Register'
    expect(page).to have_content 'Username has already been taken'
  end

  scenario "Signing up with blank First Name field" do
    visit '/signup'
    within("#signup-form") do
      fill_in 'Username', with: 'exampleuser'
      fill_in 'Password', with: 'password'
    end
    click_button 'Register'
    expect(page).to have_content "First name can't be blank"
  end

end