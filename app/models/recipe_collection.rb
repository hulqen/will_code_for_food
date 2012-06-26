# encoding: utf-8
class RecipeCollection < ActiveRecord::Base
  attr_accessible :name, :user_id, :collection_blocks_attributes
  belongs_to :user
  has_many :collection_blocks, :dependent => :destroy

  accepts_nested_attributes_for :collection_blocks, :reject_if => lambda { |a| a[:name].blank? },:allow_destroy => true

  def create_collection_blocks(type)
    if type == "week_plan"
      %w[måndag tisdag onsdag torsdag fredag lördag söndag].each do |day|
        self.collection_blocks.build(:name => day)
      end
    elsif type == "standard"
      self.collection_blocks.build(:name => "Okategoriserat")
    end
  end
end

