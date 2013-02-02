# NothsTest

Answer to a test set by Not on the high street

## Installation

Add this line to your application's Gemfile:

    gem 'noths_test'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install noths_test

## Usage

co = Checkout.new(pricing\_rules)
co.scan(item)
co.scan(item)
Price = co.total

## Thoughts

-Specify rules using hash
:rule\_type specifies rule type.

{:rule\_type => :discount\_above\_price, :price => 60, :discount => 0.1}
{:rule\_type => :bulk\_price, :product => "001", :qty => 2, price =>
8.50}

Internal:

Convert hash rules into Checkout::Rule objects that invoke the rule on
the items and calculate the savings. For now we will assume that no two
rules are mutually exclusive.


## Contributing

Please don't
