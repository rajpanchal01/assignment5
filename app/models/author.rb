class Author < ApplicationRecord
    has_one_attached :profile_picture
    has_many :books , dependent: :delete_all
    validates :name ,presence: true 
    validates :address ,presence: true
    validates :profile_picture, aspect_ratio: :square
    validates :profile_picture, attached: true, size: { less_than: 1.megabytes , message: 'should be less than 1 Mb!' }
    validate :image_type
    private
    def image_type
        if (self.profile_picture.attached?)==false
            errors.add(:profile_picture,"Are missing!")
        end
        if !(self.profile_picture.content_type.in?(%('image/png')))
            errors.add(:profile_picture,"Add png image!")  
        end
    end
end
