# Numeric

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

## Compatibility

The gem is tested to work in MRI Ruby 1.9+ and JRuby (1.9 mode).
MRI 1.8.7, REE, and Rubinius all have bugs in their implementation of `Complex`
that prevent this gem from working completely, so they are not supported.

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
