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

  scope :best_length, ->(length) { where("length >= ?", length).order('length asc') }
  scope :best_width, ->(width) { where("width >= ?", width).order('width asc') }
  scope :best_height, ->(height) { where("height >= ?", height).order('height asc') }
  scope :best_weight, ->(weight) { where("weight >= ?", weight).order('weight asc') }

  def self.best_match length, width, height, weight
    self.best_length(length).best_width(width).best_height(height).best_weight(weight)
  end
end
