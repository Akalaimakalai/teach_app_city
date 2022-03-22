# frozen_string_literal: true

feature 'edit a citizen', %q(
  In order to update an information about a citizen
  or correct mistakes
  I'd like to be able to edit a citizen
) do
  given(:citizen) { create(:citizen, name: 'OldCitizenName', age: 91) }

  scenario 'edit the citizen with correct values' do
    visit edit_citizen_url(citizen)

    fill_in 'Name', with: 'ThisNameCannotBeMadeByFaker'
    fill_in 'Age', with: 92
    click_on 'Update Citizen'

    expect(page).to have_current_path(root_path)
    expect(page).to have_content('ThisNameCannotBeMadeByFaker')
    expect(page).to have_content(92)
    expect(page).to_not have_content('OldCitizenName')
    expect(page).to_not have_content(91)
  end

  scenario 'edit the citizen with incorrect values' do
    visit edit_citizen_url(citizen)

    fill_in 'Name', with: 'Ololosh111'
    fill_in 'Age', with: 92
    click_on 'Update Citizen'

    expect(page).to have_current_path(root_path)
    expect(page).to have_content('OldCitizenName')
    expect(page).to have_content(91)
    expect(page).to_not have_content('Ololosh111')
    expect(page).to_not have_content(92)
  end
end
