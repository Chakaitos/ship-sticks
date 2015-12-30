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

  scope :best_length, ->(l) { where("length >= ?", l).order('length asc') }
  scope :best_width, ->(w) { where("width >= ?", w).order('width asc') }
  scope :best_height, ->(h) { where("height >= ?", h).order('height asc') }
  scope :best_weight, ->(w) { where("weight >= ?", w).order('weight asc') }

  def self.best_match length, width, height, weight
    self.best_length(length).best_width(width).best_height(height).best_weight(weight)
  end
end
