# ForceDomain

Rack middleware that will redirect all request that are not from the specified domain

Useful for redirecting website.herokuapp.com to www.website.com

## Installation

Add this line to your application's Gemfile:

    gem 'force_domain'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install force_domain

## Usage

If your using Rails, the middleware will be inserted automatically

Otherwise you have to insert it manually

```ruby
use ForceDomain::Middleware
```

Now all you need to do is set the environment key `APP_DOMAIN` to your specific domain

Example:

```shell
heroku config:set APP_DOMAIN=www.website.com
```

All requests made to website.herokuapp.com will now 301 redirect to www.website.com keeping path and query parameters

## Contributing

1. Fork it ( https://github.com/askehansen/force_domain/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
