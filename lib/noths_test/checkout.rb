module NothsTest
  class Checkout
    class SavingItem
      attr_accessor :saving, :price, :name, :product_code

      def initialize(hash)
        self.price = hash[:price] || -hash[:saving] || 0
        self.name = hash[:name]
        self.product_code = hash[:product_code]
      end
    end

    def initialize(pricing_rules)
      @pricing_rules = []
      @items = []

      pricing_rules.each do |r|
        @pricing_rules << PricingRules.define(r)
      end
    end

    def scan(item)
      @items << item
    end

    def total
      @pricing_rules.each do |r|
        @items << SavingItem.new(:saving => r.saving(@items))
      end

      @items.map(&:price).inject(&:+).round(2)
    end
  end
end
