# frozen_string_literal: true

feature 'delete a citizen', %q(
  In order to remove a citizen
  I'd like to be able to delete them
) do
  given(:citizen) { create(:citizen, name: 'OldCitizenName', age: 91) }

  scenario 'delete a citizen' do
    visit root_path
    expect(page).to_not have_content('OldCitizenName')
    expect(page).to_not have_content(91)

    visit edit_citizen_url(citizen)
    click_on 'Delete'

    expect(page).to have_current_path(root_path)
    expect(page).to_not have_content('OldCitizenName')
    expect(page).to_not have_content(91)
  end
end
