require 'rubygems'
require 'bundler/setup'

require 'noths_test' # and any other gems you need

module NothsTest
  class TestItem
    attr_accessor :product_code, :price, :name

    def initialize(hash)
      @product_code = hash[:product_code]
      @price = hash[:price]
      @name = hash[:name]
    end

  end
end

RSpec.configure do |config|
  # some (optional) config here
end
