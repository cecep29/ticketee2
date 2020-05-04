require "rails_helper"

RSpec.feature "User can edit existing projects" do 
  before do 
    FactoryBot.create(:project, name: "Sublime Text 2")

    visit "/"
    click_link "Sublime Text 2"
    click_link "Edit Project"
  end

  scenario "with valid attributes" do 
    fill_in "Name", with: "Sublime text 3"
    click_button "Update Project"

    expect(page).to have_content "Project has been updated."
    expect(page).to have_content "Sublime text 3"
  end

  scenario "when providing invalid attributes" do 
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content "Project has not been updated."
  end
end