require 'rails_helper'

RSpec.describe User, type: :model do

    let(:user) { create :user }
    let!(:event) { create :event, user: user }

  describe "Association to events" do
    it { is_expected.to have_many :events }
  end

  describe "Association to profile" do
    it { is_expected.to have_one :profile }
  end

  it "deletes associated events" do
    expect { user.destroy }.to change{ user.events.count }.by(-1)
  end

  describe "association with booking" do
    let(:guest_user) { create :user, email: "guest@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:event) { create :event, user: host_user }
    let!(:registration) { create :registration, event: event, user: guest_user }

    it "has bookings" do
      expect(guest_user.registered_events).to include(event)
    end
  end
end
