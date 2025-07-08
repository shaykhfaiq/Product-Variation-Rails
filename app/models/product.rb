class Product < ApplicationRecord
  has_many :variants
  has_many :product_option_types
  has_many :option_types, through: :product_option_types
end
