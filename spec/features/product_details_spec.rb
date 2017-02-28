require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page", type: :feature, js: true do

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

  scenario "They navigate to product detail page" do
    visit root_path

    expect(page).to have_css 'article.product', count: 10

    first('article.product').find('header a').click

    save_screenshot

    expect(find('section')).to have_css('products-show')


  end

end
