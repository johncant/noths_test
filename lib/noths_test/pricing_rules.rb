module NothsTest
  module PricingRules

    @@rule_klasses = {}

    # Instantiate a pricing rule
    def self.define(hash)
      if @@rule_klasses[hash[:rule_type]].nil?
        raise "No rule type for #{hash[:rule_type].inspect}"
      end
      @@rule_klasses[hash[:rule_type]].new(hash)
    end

    def self.register(sym, klass)
      @@rule_klasses[sym] = klass
    end

  end
end
