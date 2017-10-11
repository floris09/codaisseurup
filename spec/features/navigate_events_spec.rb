require 'rails_helper'

describe 'navigating events' do
  before { login_as user }

  let(:user) { create :user }
  let!(:event) { create :event, user: user}

  it "allows navigation from the details to the listing page" do
    visit event_path(event)

    click_link "Back"

    expect(current_path).to eq(events_path)
  end

  it "allows navigation from the listing page to the details page" do
    visit events_path

    click_link "View"

    expect(current_path).to eq(event_path(event))
  end

end
