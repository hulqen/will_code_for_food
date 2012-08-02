# encoding: utf-8
require File.dirname(__FILE__) + '/../spec_helper'

describe "#search" do

  context "when searching for a recipe" do
    before do
      @recipe1 = Recipe.make!(:name => "kycklingragu")
      @recipe2 = Recipe.make!(:name => "kycklingsallad")
      @recipe3 = Recipe.make!(:name => "mårdsallad")
      search_string = "kyckling"
      @search_result = Recipe.search(search_string)
    end

    it "should display recipes with the search term in their names" do
      @search_result.should include @recipe1
      @search_result.should include @recipe2
    end

    it "should not display recipes with a name that doesn't include the searc term" do
      @search_result.should_not include @recipe3
    end
  end
end