require 'rails_helper'

RSpec.describe Beer, type: :model do
  it 'is not valid without name' do
    beer = Beer.create(abv: '7%',
    style: 'IPA',
    brewery: 'Ballast Point',
    profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
    image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg')
    expect(beer.errors[:name]).to_not be_empty
  end

  it 'is not valid without an abv' do
    beer = Beer.create(name: 'Sculpin',
    style: 'IPA',
    brewery: 'Ballast Point',
    profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
    image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg')
    expect(beer.errors[:abv]).to_not be_empty
  end

  it 'is not valid without a style' do
    beer = Beer.create(name: 'Sculpin',
    abv: '7%',
    brewery: 'Ballast Point',
    profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
    image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg')
    expect(beer.errors[:style]).to_not be_empty
  end

  it 'is not valid without a brewery' do
    beer = Beer.create(name: 'Sculpin',
    abv: '7%',
    style: 'IPA',
    profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
    image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg')
    expect(beer.errors[:brewery]).to_not be_empty
  end

  it 'is not valid without a profile' do
    beer = Beer.create(name: 'Sculpin',
    abv: '7%',
    style: 'IPA',
    brewery: 'Ballast Point',
    image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg')
    expect(beer.errors[:profile]).to_not be_empty
  end

  it 'is not valid without an image' do
    beer = Beer.create(name: 'Sculpin',
    abv: '7%',
    style: 'IPA',
    brewery: 'Ballast Point',
    profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors')
    expect(beer.errors[:image]).to_not be_empty
  end

  it 'must a profile that is at least 10 characters' do
    beer = Beer.create(name: 'Sculpin',
    abv: '7%',
    style: 'IPA',
    brewery: 'Ballast Point',
    profile: 'Inspired',
    image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg')
    expect(beer.errors[:profile]).to_not be_empty
  end
end
