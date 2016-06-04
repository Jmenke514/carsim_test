require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  #pending "add some scenarios (or delete) #{__FILE__}"


  context 'going to the website' do
    Steps 'Being welcomed' do
        Given 'I am on the landing page' do
          visit '/'
        end
        Then 'I can see a welcome message' do
          expect(page).to have_content("Welcome to the Car Simulator")
        end
        
      end
    end
end
