require "rails_helper"

RSpec.feature "Users can new  ticket " do  
  let!(:user) { FactoryBot.create(:user) }
  before do
    login_as(user)
    project = FactoryBot.create(:project, name: "Internet Explorer")

    visit project_path(project)
    click_link "New Ticket"
  end

  scenario "with valid attributes" do 
    fill_in "Name", with: "Non-standards complience"
    fill_in "Description", with: "My pages are ugly!"
    click_button "Create Ticket"

    expect(page).to have_content "Ticket has been created."
    
    expect(page).to have_content "Author: #{user.email}"
    
  end

  scenario "when providing invalid attributes" do
    click_button "Create Ticket"
    
    expect(page).to have_content "Ticket has not been created."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"

  end

  scenario "with an invalid description" do 
    fill_in "Name", with: "Non-standards complience"
    fill_in "Description", with: "It Sucks"
    click_button "Create Ticket"

    expect(page).to have_content "Ticket has not been created."
    expect(page).to have_content "Description is too short"
  end
end