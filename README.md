# CodePicnic

Ruby Client for the CodePicnic's API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'codepicnic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codepicnic

## Usage

### Authentication with Rest API

```ruby
CodePicnic.client_id      = "CLIENT_ID"
CodePicnic.client_secret  = "CLIENT_SECRET"
puts CodePicnic.token
```

`CodePicnic.client_id` saves your `CLIENT_ID` that is provided in your [profile page](https://codepicnic.com/dashboard/profile). The same happens with your `CLIENT_SECRET`. Next you generate the access token for authenticate your application.

For more information and examples, check out our [API's documentation](/docs/api)

### Listing all your consoles

```ruby
results = CodePicnic::Console.all
```

### Saving a new console

```ruby
console = CodePicnic::Console.new(
  container_type: "bash",
  title: "api-spec",
  container_size: "medium"
)
console.save
```

`CodePicnic::Console.new` creates a new console with all the necessary parameters and then storage it with the `.save` method.

## Console Parameters

For a better console customization we offer you the following parameters:

| Field | Values |
| ----- | ------ |
| `custom_image` | _(optional)_ Any of user's or Docker Hub's generated Docker image |
| `container_size` | `medium` (256 MB), `large` (512 MB), `xlarge` (1 GB) or `xxlarge` (3 GB) |
| `container_type` | `bash`, `js`, `mono`, `elixir`, `go`, `nodejs`, `php`, `python`, `python340`, `python350`, `ruby`, `dancer`, `laravel`, `phoenix`, `rails`, `mongodb`, `redis` |
| `title` | _(optional)_ Pick a name for your console. Make it personal! |
| `hostname` | _(optional)_ Any name you'd like to be used as your console hostname: `user@your_custom_hostname`
| `current_mode` | _(optional)_ The mode the console is currently in: `public`, `draft`, `collaborative` and `streaming`.

## Methods

`CodePicnic::Console` has the following methods:

* `CodePicnic::Console#start` : Start the server attached to the console and returns the result.
* `CodePicnic::Console#stop`: Stop the server attached to the console and returns the result.
* `CodePicnic::Console#restart`: Restart the server attached to the console and returns the result.
* `CodePicnic::Console#upload_file(file, path = nil)`: Uploads a File object to the console to the `path`
* `CodePicnic::Console.find(container_name = "")` : Returns a single CodePicnic::Console instance
* `CodePicnic::Console.forks` : Check out the forks the console has.
* `CodePicnic::Console.file(path = "")` : Returns the list of files that has been added to the console.
* `CodePicnic::Console#exec(commands = [])` : Execute commands inside the server attached to the console and returns the commands content.
* `CodePicnic::Console.all` : Return an array of consoles created by the user.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/codepicnic-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

