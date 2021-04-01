class Artwork < ApplicationRecord

    validates :title, presence: true, uniqueness: true
end