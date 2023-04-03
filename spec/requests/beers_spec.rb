require 'rails_helper'

RSpec.describe "Beers", type: :request do
  describe "GET /index" do
    it 'gets a list of beers' do
      Beer.create(
        name: 'Sculpin',
        abv: '7%',
        style: 'IPA',
        brewery: 'Ballast Point',
        profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
        image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg'
    )

    get '/beers'
    beer = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    expect(beer.length).to eq 1
    end
  end

  describe 'POST /create' do
    it 'creates a beer' do
      beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7%',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      post '/beers', params: beer_params
      expect(response).to have_http_status(200)

      beer = Beer.last 
      expect(beer.name).to eq 'Sculpin'
      expect(beer.abv).to eq '7%'
      expect(beer.style).to eq 'IPA'
      expect(beer.brewery).to eq 'Ballast Point'
      expect(beer.profile).to eq 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors'
      expect(beer.image).to eq 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg'
    end
    
    it "doesn't create a beer without a name" do
      beer_params = {
        beer: {
          abv: '7%',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      post '/beers', params: beer_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['name']).to include "can't be blank"
    end

    it "doesn't create a beer without an abv" do
      beer_params = {
        beer: {
          name: 'Sculpin',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      post '/beers', params: beer_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['abv']).to include "can't be blank"
    end

    it "doesn't create a beer without a style" do
      beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7%',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      post '/beers', params: beer_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['style']).to include "can't be blank"
    end

    it "doesn't create a beer without a brewery" do
      beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7%',
          style: 'IPA',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      post '/beers', params: beer_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['brewery']).to include "can't be blank"
    end

    it "doesn't create a beer without a profile" do
      beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7%',
          style: 'IPA',
          brewery: 'Ballast Point',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      post '/beers', params: beer_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['profile']).to include "can't be blank"
    end

    it "doesn't create a beer without an image" do
      beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7%',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
        }
      }

      post '/beers', params: beer_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['image']).to include "can't be blank"
    end
  end

  describe  'PATCH /update' do
    it 'updates a beer' do
      beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7%',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      post '/beers', params: beer_params
      beer = Beer.last

      updated_beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7.0%',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      patch "/beers/#{beer.id}", params: updated_beer_params
      updated_beer = Beer.find(beer.id)
      expect(response).to have_http_status(200)
      expect(updated_beer.abv).to eq '7.0%'
    end

    
    it "doesn't update a beer without a name" do
      beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7%',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      post '/beers', params: beer_params
      beer = Beer.last

      updated_beer_params = {
        beer: {
          name: '',
          abv: '7.0%',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      patch "/beers/#{beer.id}", params: updated_beer_params
      updated_beer = Beer.find(beer.id)
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['name']).to include "can't be blank"
    end

    it "doesn't update a beer without an abv" do
      beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7%',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      post '/beers', params: beer_params
      beer = Beer.last

      updated_beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      patch "/beers/#{beer.id}", params: updated_beer_params
      updated_beer = Beer.find(beer.id)
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['abv']).to include "can't be blank"
    end

    it "doesn't update a beer without a style" do
      beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7%',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      post '/beers', params: beer_params
      beer = Beer.last

      updated_beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7.0%',
          style: '',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      patch "/beers/#{beer.id}", params: updated_beer_params
      updated_beer = Beer.find(beer.id)
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['style']).to include "can't be blank"
    end

    it "doesn't update a beer without a brewery" do
      beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7%',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      post '/beers', params: beer_params
      beer = Beer.last

      updated_beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7.0%',
          style: 'IPA',
          brewery: '',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      patch "/beers/#{beer.id}", params: updated_beer_params
      updated_beer = Beer.find(beer.id)
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['brewery']).to include "can't be blank"
    end

    it "doesn't update a beer without a profile" do
      beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7%',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      post '/beers', params: beer_params
      beer = Beer.last

      updated_beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7.0%',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: '',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      patch "/beers/#{beer.id}", params: updated_beer_params
      updated_beer = Beer.find(beer.id)
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['profile']).to include "can't be blank"
    end

    it "doesn't update a beer without an image" do
      beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7%',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      post '/beers', params: beer_params
      beer = Beer.last

      updated_beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7.0%',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: '',
        }
      }

      patch "/beers/#{beer.id}", params: updated_beer_params
      updated_beer = Beer.find(beer.id)
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['image']).to include "can't be blank"
    end
  end

  describe 'DELETE /destroy' do
    it 'deletes a beer' do
      beer_params = {
        beer: {
          name: 'Sculpin',
          abv: '7%',
          style: 'IPA',
          brewery: 'Ballast Point',
          profile: 'Inspired hops creates hints of apricot, peach, mango, and lemon flavors',
          image: 'https://live.staticflickr.com/701/20776238708_7c7871a6f4_b.jpg',
        }
      }

      post '/beers', params: beer_params
      beer = Beer.first
      beers = Beer.all

      delete "/beers/#{beer.id}"
      expect(response).to have_http_status(200)
      expect(beers).to be_empty

    end
  end
end
