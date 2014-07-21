require 'spec_helper'

feature 'Homepage' do
  scenario 'Shows the welcome message' do
    visit '/'
    expect(page).to have_content 'Welcome!'
  end

  scenario "Shows user input messages" do
    visit '/'
    expect(page).to have_content("Messages")
    fill_in "Name", with: "Seth"
    fill_in "Message", with: "This is my test message"
    click_on "Add Message"
    expect(page).to have_content("This is my test message")
    expect(page).to have_content("Seth")
  end

end