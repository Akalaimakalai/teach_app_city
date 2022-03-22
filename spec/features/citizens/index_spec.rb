# frozen_string_literal: true

feature 'get collection of citizens', %q(
  In order to see a list of citizens
  I'd like to be able to request it
) do
  given!(:citizens) { create_list(:citizen, 2) }

  scenario 'user visits root page' do
    visit citizens_path

    citizens.each do |citizen|
      expect(page).to have_content citizen.name
    end
  end
end
