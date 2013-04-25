module NothsTest
  module PricingRules
    class DiscountAbovePrice

      def initialize(hash)
        @price = hash[:price]
        @discount = hash[:discount]
      end

      def saving(items)
        if items.empty?
          total = 0
        else
          total = items.map(&:price).inject(&:+)
        end

        if total > @price
          total*@discount
        else
          0
        end
      end

    end
  end
end

