require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature,  js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "The cart should increase by one when clicking the Add button" do
    # ACT
    visit root_path

    all('.product').first.click_on('Add')

  
    expect(page).to have_link('My Cart (1)')

    # DEBUG / VERIFY
    save_screenshot

  end


 
end
