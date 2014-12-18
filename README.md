# Sinatra::Praat

A Sinatra extension for running basic Praat commands.

This is not really intended for use outside of the
[vocal-tract-length](https://github.com/mxhold/vocal-tract-length) project so it
offers very little functionality but may be useful as a reference.

# Usage

Currently, it adds a helper method `extract_formant1` and a POST route
`/extract_formant1`.

The helper method takes the same arguments as the Praat [To
Formant...](http://www.fon.hum.uva.nl/praat/manual/Sound__To_Formant__burg____.html)
command, but the route uses defaults for all the arguments except the file.

The 'POST /extract_formant1` route expects a WAV file as the `data` param and returns its mean F_1.

## Installation

This assumes you have already installed [Praat](http://praat.org) and it is
available as `praat` in your $PATH.

Add this line to your application's Gemfile:

```ruby
gem 'sinatra-praat'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinatra-praat

In your Sinatra application, add the following:

```
require 'sinatra/praat'

class MyApp < Sinatra::Base
  register Sinatra::Praat
end
```

## Contributing

Run tests with: `rake test`

1. Fork it ( https://github.com/mxhold/sinatra-praat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
