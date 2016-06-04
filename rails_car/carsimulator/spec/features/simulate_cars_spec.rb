require 'rails_helper'

RSpec.feature "SimulateCars", type: :feature do
  context 'Creating a car for simulating' do
    Steps 'Creating a car' do
      Given 'I am on the landing page' do
        visit '/'
      end
      When 'I fill in the car make and model year' do
          fill_in 'make', with: 'Daewoo'
          fill_in 'model_year', with: '2000'
      end
      And 'I can submit the information' do
          click_button 'Create new car'
      end
      Then 'I can see the information of a car' do
        expect(page).to have_content('Make: Daewoo')
        expect(page).to have_content('Year: 2000')
      end
      And 'I can see the speed of the car' do
        expect(page).to have_content('Speed: 0')
      end
    end
  end
  context 'Accelerating the car' do
    Steps 'Speeding the car up' do
      Given 'I have created a car' do
        visit '/'
        fill_in 'make', with: 'Daewoo'
        fill_in 'model_year', with: '2000'
        click_button 'Create new car'
      end
      And 'I can see the information of a car' do
        expect(page).to have_content('Make: Daewoo')
        expect(page).to have_content('Year: 2000')
      end
      And 'The speed of the car is 0' do
        expect(page).to have_content('Speed: 0')
      end
      When 'I click the accelerate button' do
        click_button('Accelerate')
      end
      Then 'The speed of the car increases by 10' do
        expect(page).to have_content('Speed: 10')
      end
    end
  end


  context 'Slowing the car down' do
    Steps 'Brakeing the car' do
      Given 'I have created a car' do
        visit '/'
        fill_in 'make', with: 'Daewoo'
        fill_in 'model_year', with: '2000'
        click_button 'Create new car'
      end
      And 'I can see the information of a car' do
        expect(page).to have_content('Make: Daewoo')
        expect(page).to have_content('Year: 2000')
      end
      And 'The speed is more than 0' do
        click_button('Accelerate')
        expect(page).to have_content('Speed: 10')
      end
      When 'I click the brake button' do
        click_button('Brake')
      end
    end
  end
end
