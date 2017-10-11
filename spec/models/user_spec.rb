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


end
