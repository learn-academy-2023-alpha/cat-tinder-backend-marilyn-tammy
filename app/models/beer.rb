class Beer < ApplicationRecord
    validates :name, :abv, :style, :brewery, :profile, :image, presence: true

    validates :profile, length: { minimum: 10 }
end
