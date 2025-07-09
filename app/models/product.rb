class Product < ApplicationRecord
  has_many :variants, dependent: :destroy
  has_many :product_option_types, dependent: :destroy
  has_many :option_types, through: :product_option_types ,dependent: :destroy
end
