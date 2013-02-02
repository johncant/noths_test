require 'spec_helper'

describe NothsTest::Checkout do

  let :products do
    product_index = {
      "001" => {:price => 9.25, :name => "Lavender Heart"},
      "002" => {:price => 45.00, :name => "Personalised cufflinks"},
      "003" => {:price => 19.95, :name => "Kids T-shirt"}
    }

    product_index.each do |k,v|
      v[:product_code] = k
    end

    product_index
  end

  let :pricing_rules do
    [
      {:rule_type => :discount_above_price, :price => 60, :discount => 0.1},
      {:rule_type => :bulk_price, :product => "001", :qty => 2, :price => 8.50}
    ]
  end

  let :checkout do
    NothsTest::Checkout.new(pricing_rules)
  end

  def new_item(product_code)
    NothsTest::TestItem.new(products[product_code])
  end

  def total_for(*product_codes)
    product_codes.each do |pc|
      checkout.scan new_item(pc)
    end

    checkout.total
  end

  it "returns the price for a single item" do
    total_for("001").should == 9.25
  end

  it "respects a discount_above_price rule" do
    total_for("001", "002", "003").should == 66.78
  end

  it "respects a buy one get one free rule" do
    total_for("001", "003", "001").should == 36.95
  end

  it "works for the extra test case provided by NOTHS" do
    total_for("001", "002", "001", "003").should == 73.76
  end

end
