require 'rails_helper'

RSpec.describe Profile, type: :model do

describe "association to user:" do
  it { is_expected.to belong_to :user }
end



end
