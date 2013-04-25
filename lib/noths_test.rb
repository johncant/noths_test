require "noths_test/version"

require "noths_test/checkout"
require "noths_test/pricing_rules"

# Actual rules
require "noths_test/pricing_rules/discount_above_price"
require "noths_test/pricing_rules/bulk_price"

module NothsTest
end

NothsTest::PricingRules.register :discount_above_price, NothsTest::PricingRules::DiscountAbovePrice
NothsTest::PricingRules.register :bulk_price, NothsTest::PricingRules::BulkPrice
