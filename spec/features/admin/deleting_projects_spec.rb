require "rails_helper"

RSpec.feature "User can delete projects" do   
  before do 
    login_as(FactoryBot.create(:user, :admin))
  end 

  scenario "successfully" do 
    FactoryBot.create(:project, name: "Sublime Text 3")

    visit "/"
    click_link "Sublime Text 3"
    click_link "Delete Project"

    expect(page).to have_content "Project has been deleted."
    expect(page.current_url).to eq projects_url
    expect(page).to have_no_content "Sublime Text 3"
  end
end