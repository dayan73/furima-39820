class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  has_one_attached :image
  
  validates :content, presence: true
end
