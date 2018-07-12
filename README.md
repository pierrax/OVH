# Ovh

Ovh is a lightweight Ruby HTTP client for interacting with [OVH's API](https://eu.api.ovh.com).

It's a work in progress - pull requests are appreciated for additional API endpoints etc.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ovh'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ovh

## Usage

[Sign up here](https://eu.api.ovh.com/createApp/) in order to get your application key and application secret.

Setup the configuration for the client:

```ruby
  Ovh.configure do |config|
    config.application_key        =   "YOUR_APPLICATION_KEY"
    config.application_secret     =   "YOUR_APPLICATION_SECRET"
  end
```

Request a new consumer key using either bin/consumer_key or manually (which allows you to customize the credentials you want):

```ruby
  client    =   Ovh::Client.new
  response  =   client.request_consumer_key # Will default to only allow GET requests if invoked without custom access rules
```

In the response/hash you'll receive there'll be a validation url as well as a consumer key. Visit the validation url and grant privileges to the consumer key.

Now update your client configuration again:

```ruby
  Ovh.configure do |config|
    config.application_key        =   "YOUR_APPLICATION_KEY"
    config.application_secret     =   "YOUR_APPLICATION_SECRET"
    config.consumer_key           =   "YOUR_CONSUMER_KEY"
  end
```

Now you can use all of the available API:s!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SebastianJ/ovh. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ovh project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/SebastianJ/ovh/blob/master/CODE_OF_CONDUCT.md).
