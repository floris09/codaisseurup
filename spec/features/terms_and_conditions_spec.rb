require 'rails_helper'

describe 'T&C page' do

  it 'shows terms and conditions' do
    visit root_path

    click_link "Terms and Conditions"

    expect(page).to have_content("Terms and Conditions")
  end

end
