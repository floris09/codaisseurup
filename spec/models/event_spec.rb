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


end
