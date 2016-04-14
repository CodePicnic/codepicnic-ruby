lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codepicnic'
CodePicnic.client_id = "db43170afee829f2d6823530d4c2fce22d103c2a16fc6241d32e9f37f5e32af9"
CodePicnic.client_secret = "dc3ca309a2d5da9578d3b8092590ba499c8c9771846b1dbfff04cb265545501c"

c = CodePicnic::Console.new container_size: "medium", container_type: "bash", hostname: "this-is-a-test"



c = CodePicnic::Console.new(container_size: "medium", container_type: "bash", hostname: "a-custom-hostname-for-me")

# Codepicnic::Ruby

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/codepicnic/ruby`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'codepicnic-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codepicnic-ruby

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/codepicnic-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

