require 'rails_helper'
require 'support/capybara'

RSpec.describe "Professor CRUD", type: :system do
  context "upon displaying a professor's page" do
    before do
      open_professor_dropdown

      click_link "Professor List"
      click_link "Palmer, Ada"
    end

    it "lets me view that professor's info" do
      expect(page).to have_text("Palmer, Ada")
      expect(page).to have_text("Average Overall Rating: 4.0 (5 Reviews)")
    end

    it "lets me view that professor's classes" do
      expect(page).to have_text("Medieval History")
    end

    it "lets me delete that professor" do
      click_link "Delete"

      expect(page).not_to have_text("Palmer, Ada")
    end

    it "lets me view that professor's reviews" do
      click_link "View All Reviews"

      expect(page).to have_text("Rating")
    end
  end

  context "upon displaying the form for updating a professor" do
    before do
      open_professor_dropdown

      click_link "Professor List"

      click_link "Finn, Dewey"
      click_link "Edit"
    end

    it "lets me update an existing professor" do
      uncheck "Music"
      click_button "Submit"

      expect(page).not_to have_text("Music")
    end

    it "displays validation error messages" do
      fill_in "First name", with: ""
      fill_in "Last name", with: ""
      click_button "Submit"

      expect(page).to have_text("First name can't be blank")
      expect(page).to have_text("Last name can't be blank")
    end
  end

  context "upon displaying the form for creating a professor" do
    before do
      open_professor_dropdown

      click_link "New Professor"
    end

    it "lets me create a new professor" do
      fill_in "First name", with: "Jherek"
      fill_in "Last name", with: "Swanger"
      check "Medieval History"
      click_button "Submit"

      expect(page).to have_text("Swanger, Jherek")
      expect(page).to have_text("Medieval History")
    end

    it "displays validation error messages" do
      click_button "Submit"

      expect(page).to have_text("First name can't be blank")
      expect(page).to have_text("Last name can't be blank")
    end
  end

  private

  def open_professor_dropdown
    visit root_path
    click_link "Professors"
  end
end
