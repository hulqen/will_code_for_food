require File.dirname(__FILE__) + '/../spec_helper'

describe "Ingredient" do
  let(:ingredient) { Ingredient.make! }

  describe "validations" do
    it "can be valid" do
      Ingredient.make.should be_valid
    end

    it "requires a product" do
      ingredient.product = nil
      ingredient.should have(1).error_on(:product)
    end

    it "requires a unit if amount is set" do
      ingredient.amount = 32
      ingredient.should have(1).error_on(:unit_name)
    end

    it "requires an amount if unit is set" do
      unit = Unit.make!
      ingredient.unit_name = unit.name
      ingredient.should have(1).error_on(:amount)
    end
  end

  describe "#convert_unit" do
    before do
      @unit = Unit.make!(:name => "burk")
      @unit2 = Unit.make!(:name => "skiva")
      Unit.make!(:name => "st")
      # Obs! Notera att "new" inte kör några valideringar (jmf "make" och "create")
      @ingredient = Ingredient.make!(:unit_name =>"st", :amount => 32)
    end

    it "sets the unit to the unit with the given name" do
      puts @ingredient.inspect
      @ingredient.unit_name = "skiva"
      @ingredient.save!
      @ingredient.unit.should eq(@unit2)
    end

    it "keeps the amount when unit not converted" do
      @ingredient.unit_name = "burk"
      @ingredient.save!
      @ingredient.amount.should eq(32)
    end

    it "raises error when given a unit not in the units array" do
      @ingredient.unit_name = "hekto"
      expect{@ingredient.save!}.to raise_error
    end

    describe "to liters" do
      before do
        Unit.make!(:name => "l")
        @ingredient = Ingredient.make!(:amount => 3245, :unit_name => "burk")
      end

      it "converts unit from ml to l" do
        @ingredient.unit_name = "ml"
        @ingredient.save!
        @ingredient.unit.name.should eq("l")
        @ingredient.amount.should eq(3.245)
      end

      it "converts unit from cl to l" do
        @ingredient.unit_name = "cl"
        @ingredient.save!
        @ingredient.unit.name.should eq("l")
        @ingredient.amount.should eq(32.45)
      end

      it "converts unit from dl to l" do
        @ingredient.unit_name = "dl"
        @ingredient.save!
        @ingredient.unit.name.should eq("l")
        @ingredient.amount.should eq(324.5)
      end
    end

    describe "to grams" do
      before do
        Unit.make!(:name => "g")
        @ingredient = Ingredient.make!(:amount => 32, :unit_name => "burk")
      end

      it "converts unit from hg to g" do
        @ingredient.unit_name = "hg"
        @ingredient.save!
        @ingredient.unit.name.should eq("g")
        @ingredient.amount.should eq(3200)
      end

      it "converts unit from kg to g" do
        @ingredient.unit_name = "kg"
        @ingredient.save!
        @ingredient.unit.name.should eq("g")
        @ingredient.amount.should eq(32000)
      end
    end
  end
end