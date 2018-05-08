class Prospect < ApplicationRecord
  validates :title, presence:true
  validates :first_name, presence:true, length: {maximum:50}
  validates :second_name, presence:true, length: {maximum:50}
  REGEX_FOR_VALID_EMAIL=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255}, format: {with: REGEX_FOR_VALID_EMAIL},
                    uniqueness: { case_sensitive: false}

  validates :message, presence:true, length: {minimum:10}
end
