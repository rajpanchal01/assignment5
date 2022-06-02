class Book < ApplicationRecord
    belongs_to :author 
    has_many_attached :cover_photos
    validates :name ,presence: true 
    validates :cover_photos, aspect_ratio: :square
    validates :cover_photos, attached: true, size: { less_than: 1.megabytes , message: 'should be less than 1 Mb!' }
    validate :image_type
    private
    def image_type
        if (self.cover_photos.attached?)==false
            errors.add(:cover_photos,"Are missing!")
        end
        self.cover_photos.each do |image|
            if !image.content_type.in?(%('image/png'))
                errors.add(:cover_photos,"Add png image!")
            end
        end
    end
end
