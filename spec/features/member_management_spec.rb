require 'rails_helper'

RSpec.feature 'Member management' do
  let(:admin) { create(:user, :admin) }

  before(:each) do
    10.times { create(:user) }
    login_as(admin, scope: :user)
  end

  scenario 'Admin list all members' do
    visit 'members'

    expect(page).to have_selector('table.table tbody tr', count: 8)
    expect(page).to have_selector('table.table th', text: 'Role')
  end

  scenario 'Admin create a new user' do
    visit '/members/new'

    fill_in 'member_first_name', with: 'Bat'
    fill_in 'member_last_name', with: 'Man'
    fill_in 'member_email', with: 'batman@mail.com'
    select '1980', from: 'member_birth_date_1i'
    select 'January', from: 'member_birth_date_2i'
    select '1', from: 'member_birth_date_3i'
    choose 'female'
    select 'Admin', from: 'Role'
    uncheck 'Active'

    click_button 'Create'

    expect(User.count).to eq(12)

    new_user = User.last
    expect(new_user.email).to eq('batman@mail.com')
    expect(new_user.birth_date).to eq(Date.parse('01/01/1980'))
    expect(new_user.gender).to eq('female')
    expect(new_user.active).to be_falsey
  end
end
