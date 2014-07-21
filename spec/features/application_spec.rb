require 'spec_helper'

feature 'Homepage' do
  before(:each) do
    visit "/"
  end

  scenario 'Shows the welcome message' do
    expect(page).to have_content 'Welcome!'
  end

  scenario "Shows user input messages" do
    expect(page).to have_content("Messages")
    create_a_sample_message("Seth")
    create_a_sample_message("Stu")
    expect(page).to have_content("This is a Seth test message")
    expect(page).to have_content("Seth")
    expect(page).to have_content("This is a Stu test message")
    expect(page).to have_content("Stu")
  end

end