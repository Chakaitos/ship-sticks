class Product
  include Mongoid::Document
  field :name, type: String
  field :type, type: String
  field :length, type: Integer
  field :width, type: Integer
  field :height, type: Integer
  field :weight, type: Integer

  validates :name, :type, :length, :width, :height, :weight, presence: true
  validates :name, uniqueness: true
end
