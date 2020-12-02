class Student < ApplicationRecord
    validates :first_name, :last_name, :email, :year_of_birth, :gender, :fathers_name, :mothers_name, :address, presence: true
    validates :email, :last_name, :mothers_name, uniqueness: true
    validates :first_name, :last_name, length: {minimum: 3}
    has_one_attached :image
end
