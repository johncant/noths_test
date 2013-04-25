module NothsTest
  module PricingRules
    class BulkPrice

      def initialize(hash)
        @product_code = hash[:product_code]
        @qty = hash[:qty]
        @price = hash[:price]
      end

      def saving(items)
        eligible_items = items.find_all do |item| item.product_code == @product_code end

        if eligible_items.count < @qty
          0
        else
          (eligible_items.first.price-@price)*eligible_items.count
        end
      end

    end
  end
end
