# frozen_string_literal: true

feature 'create a citizen', %q(
  In order to add a new citizen
  I'd like to be able to create one
) do
  scenario 'create a citizen with correct values' do
    visit root_path
    expect(page).to_not have_content('George Lucas')
    expect(page).to_not have_content(5)

    visit new_citizen_url

    fill_in 'Name', with: 'George Lucas'
    fill_in 'Age', with: 5
    click_on 'Create Citizen'

    expect(page).to have_current_path(root_path)
    expect(page).to have_content('George Lucas')
    expect(page).to have_content(5)
  end

  scenario 'create a citizen with incorrect values' do
    visit root_path
    expect(page).to_not have_content('George Lucas')
    expect(page).to_not have_content(5)

    visit new_citizen_url

    fill_in 'Name', with: 'George Lucas'
    fill_in 'Age', with: -5
    click_on 'Create Citizen'

    expect(page).to have_current_path(root_path)
    expect(page).to_not have_content('George Lucas')
    expect(page).to_not have_content(5)
  end
end
