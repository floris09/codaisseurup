require "rails_helper"

describe "Add new event" do
  before do
    login_as user
    visit events_path
    click_on "Add new event"
    fill_in "Event name", with: "testfeestje"
  end
  let(:user) { create :user }


  context "When user does not enter description" do
    it "does not allow user to add event" do
      click_on "Save"
      expect(page).to have_content("Description can't be blank")
    end
  end
end
