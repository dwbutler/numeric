# Numeric [![Build Status](https://travis-ci.org/dwbutler/numeric.png)](https://travis-ci.org/dwbutler/numeric)

Checking if a given value is "numeric" is a common problem. How can we do in this Ruby?
There are many problematic ways, such as converting to an integer or float or using a regex:

```ruby
"String".to_i
# => 0

nil.to_f
# => 0.0

:'0'.to_i
# NoMethodError: undefined method `to_i' for :"0":Symbol

"1e5" =~ /^\d*$/
 => nil
```

This gem defines a simple (and correct) `#numeric?` method on all Ruby objects.
The rules are simple:

 * All descendants of `Numeric` are numeric.
 * All strings or symbols that can be converted with `Complex()` are numeric.
 * All other objects are not numeric.

If you want to get more specific, the following methods are also defined:

 * `#integer?`
 * `#float?`
 * `#decimal?`
 * `#rational?`
 * `#complex?`

Note that for these more specific methods, a string that can be converted to
a `Float` (such as '1') will return `true` for `#float?`. An instance of a different
Numeric class (such as 1, Integer) will return `false` for `#float?`.

## Compatibility

The gem is tested to work in MRI Ruby 1.9 - 2.0, and JRuby (1.9 mode).
All other Rubies are too lax in what their `Numeric` classes accept, which prevents
this gem from working completely.

MRI 2.0.0's `BigDecimal` class is also too lax in what it accepts, so `'a'.decimal?` will
unfortunately return `true`.

## Installation

Add this line to your application's Gemfile:

    gem 'numeric'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install numeric

## Usage

```ruby
require 'numeric'

3.numeric?
# => true

'1'.numeric?
# => true

'3e10'.numeric?
# => true

:'0'.numeric?
# => true

'abc123'.numeric?
# => false

{}.numeric?
# => false
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
