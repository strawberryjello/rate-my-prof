require 'rails_helper'
require 'support/capybara'

RSpec.describe "MyClass CRUD", type: :system do
  context "upon displaying a class page" do
    before do
      open_class_dropdown

      click_link "Class List"
      click_link "Archaeology"
    end

    it "lets me view the class info" do
      expect(page).to have_text("Archaeology")
    end

    it "lets me view the professors for that class" do
      expect(page).to have_text("Jones, Henry")
    end

    it "lets me delete that class" do
      click_link "Delete"

      expect(page).not_to have_text("Archaeology")
    end

    it "lets me review a professor who teaches that class" do
      click_link "Review This Professor"

      find("#review_rating").first(:option, "4").select_option
      fill_in "Description", with: "not boring"

      click_button "Submit"

      expect(page).to have_text("Review was successfully created.")
    end
  end

  context "upon displaying the form for updating a class" do
    before do
      open_class_dropdown

      click_link "Class List"

      click_link "Physics"
      click_link "Edit"
    end

    it "lets me update an existing class" do
      uncheck "Feynman, Richard"
      click_button "Submit"

      expect(page).not_to have_text("Feynman, Richard")
    end

    it "displays validation error messages" do
      fill_in "Name", with: ""
      click_button "Submit"

      expect(page).to have_text("Name can't be blank")
    end
  end

  context "upon displaying the form for creating a class" do
    before do
      open_class_dropdown

      click_link "New Class"
    end

    it "lets me create a new class" do
      fill_in "Name", with: "Homeroom"
      check "Yamaguchi, Kumiko"
      click_button "Submit"

      expect(page).to have_text("Homeroom")
      expect(page).to have_text("Yamaguchi, Kumiko")
    end

    it "displays validation error messages" do
      click_button "Submit"

      expect(page).to have_text("Name")
    end
  end

  private

  def open_class_dropdown
    visit root_path
    click_link "Classes"
  end
end
