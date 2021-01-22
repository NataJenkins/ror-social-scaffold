require 'rails_helper'

RSpec.describe 'friends', type: :feature do
  scenario 'accept' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Nata'
    fill_in 'Email', with: 'nata@nata'
    fill_in 'Password', with: 'natanata'
    fill_in 'Password confirmation', with: 'natanata'
    click_on 'Sign up'

    visit '/users'
    expect(page).to have_text("You didn't received any friend request yet.")
  end

  scenario 'accept' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Nata'
    fill_in 'Email', with: 'nata@nata'
    fill_in 'Password', with: 'natanata'
    fill_in 'Password confirmation', with: 'natanata'
    click_on 'Sign up'
    click_on 'Sign out'

    visit new_user_registration_path
    fill_in 'Name', with: 'finch'
    fill_in 'Email', with: 'finch@finch'
    fill_in 'Password', with: 'finchfinch'
    fill_in 'Password confirmation', with: 'finchfinch'
    click_on 'Sign up'

    visit '/users'
    first("input[type='submit']").click
    click_on('Sign out')
    fill_in 'user_email', with: 'nata@nata'
    fill_in 'user_password', with: 'natanata'
    find("input[type='submit']").click
    visit '/users'
    expect(page).to have_text('Accept')
  end

  scenario 'reject' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Nata'
    fill_in 'Email', with: 'nata@nata'
    fill_in 'Password', with: 'natanata'
    fill_in 'Password confirmation', with: 'natanata'
    click_on 'Sign up'
    click_on 'Sign out'

    visit new_user_registration_path
    fill_in 'Name', with: 'finch'
    fill_in 'Email', with: 'finch@finch'
    fill_in 'Password', with: 'finchfinch'
    fill_in 'Password confirmation', with: 'finchfinch'
    click_on 'Sign up'

    visit '/users'
    first("input[type='submit']").click
    click_on('Sign out')
    fill_in 'user_email', with: 'nata@nata'
    fill_in 'user_password', with: 'natanata'
    find("input[type='submit']").click
    visit '/users'
    expect(page).to have_text('Reject')
  end

  scenario 'no requests' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Nata'
    fill_in 'Email', with: 'nata@nata'
    fill_in 'Password', with: 'natanata'
    fill_in 'Password confirmation', with: 'natanata'
    click_on 'Sign up'
    visit '/users'
    expect(page).to have_text("You didn't received any friend request yet.")
  end

  it 'works' do
    expect(true).to be(true)
  end
end
