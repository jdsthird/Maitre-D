require 'rails_helper'
require 'capybara/rails'
require 'rack_session_access/capybara'

feature "Creating new event" do
  background do
    user = User.create!(first_name: 'John', last_name: 'Doe', email: 'example@email.com', username: 'exampleuser', password: 'password')
    page.set_rack_session(user_id: user.id)
  end

  scenario "with all fields populated" do
    visit '/events/new'
    within("#event-form") do
      fill_in 'Name', with: 'Smith-Jones Wedding'
      fill_in 'event[table][number]', with: 6
      fill_in 'event[table][number_of_seats]', with: 8
      fill_in 'Address line one', with: '123 N. Fake St.'
      fill_in 'Address line two', with: 'Apt. 3B'
      fill_in 'State', with: 'IL'
      fill_in 'Zip code', with: '60654'
      select 'September', from: 'event[begins_at(2i)]'
      select '19', from: 'event[begins_at(3i)]'
      select '2015', from: 'event[begins_at(1i)]'
      select '06 PM', from: 'event[begins_at(4i)]'
      select '00', from: 'event[begins_at(5i)]'
      select 'September', from: 'event[ends_at(2i)]'
      select '19', from: 'event[ends_at(3i)]'
      select '2015', from: 'event[ends_at(1i)]'
      select '10 PM', from: 'event[begins_at(4i)]'
      select '00', from: 'event[begins_at(5i)]'
    end
    click_button 'Create Event'
    expect(page).to have_content 'Smith-Jones Wedding'
  end

  scenario "with fields missing" do
    visit '/events/new'
    within("#event-form") do
      fill_in 'Name', with: 'Smith-Jones Wedding'
    end
    click_button 'Create Event'
    expect(page).to have_content "Zip code can't be blank"
  end
end

feature "Editing an event" do
end

feature "Deleting an event" do
end
