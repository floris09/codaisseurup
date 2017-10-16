require 'rails_helper'

RSpec.describe Event, type: :model do

  describe "#bargain?" do
    let(:cheap_event) { create :event, price: 10 }
    let(:bit_expensive_event) { create :event, price: 50 }
    let(:expensive_event) { create :event, price: 100 }

    it "Checks is an event is a bargain" do
      expect(cheap_event.bargain?).to eq(true)
      expect(expensive_event.bargain?).to eq(false)
    end
  end

    describe ".order_by_price" do
      let(:cheap_event) { create :event, price: 10 }
      let(:bit_expensive_event) { create :event, price: 50 }
      let(:expensive_event) { create :event, price: 100 }

      it "Orders the prices in ascending order" do
        expect(Event.order_by_price).to eq([cheap_event, bit_expensive_event, expensive_event])
      end
    end

    describe "association with user" do
      let(:user) { create :user }

      it { is_expected.to belong_to :user}
    end

    describe "association to categories" do
      let(:event) { create :event }
      let(:category1) { create :category, events: [event] }
      let(:category2) { create :category, events: [event] }
      let(:category3) { create :category, events: [event] }
      it { is_expected.to have_and_belong_to_many :categories }
    end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
  end

  describe "association with registration" do
    let(:guest_user) { create :user, email: "guest@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:event) { create :event, user: host_user }
    let!(:registration) { create :registration, event: event, user: guest_user }

    it "has guests" do
      expect(event.guests).to include(guest_user)
    end
end

  describe ".order_by_name" do
    let!(:event3) { create :event, name:"EF" }
    let!(:event1) { create :event, name:"AB" }
    let!(:event2) { create :event, name:"CD" }

    it "orders in ascending order" do
      expect(Event.order_by_name).to eq([event1, event2, event3])
    end
  end

  describe "scope :published" do
    let!(:event3) { create :event, active: false }
    let!(:event1) { create :event, active: true }
    let!(:event2) { create :event, active: false }

    it "shows only active events" do
      expect(Event.published).to eq([event1])
    end
  end


end
