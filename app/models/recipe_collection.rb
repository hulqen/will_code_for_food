# encoding: utf-8
class RecipeCollection < ActiveRecord::Base
  attr_accessible :name, :user_id
  belongs_to :user
  has_many :collection_blocks, :dependent => :destroy

  def create_collection_blocks(type)
    if type == "veckoplan"
      %w[måndag tisdag onsdag torsdag fredag lördag söndag].each do |day|
        self.collection_blocks.create!(:name => day)
      end
    end
  end

end

