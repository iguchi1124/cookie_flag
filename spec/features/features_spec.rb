require 'rails_helper'

RSpec.feature 'feature flag spec' do
  scenario 'new feature should be unavailable' do
    visit '/features'
    expect(page).to have_content('New feature is unavailable.')
  end

  context 'when feature flag enabled' do
    before { enable_feature(:new_feature) }

    scenario 'new feature should be available' do
      visit '/features'
      expect(page).to have_content('New feature is available!')
    end
  end
end
