# OTB Job Queuer

Welcome to your new gem from OTB! It is a job queuer and can be user on the terminal or a Gem in your projects.
The gem takes in a string in the format of:
```
a =>
b => c
c =>
```
or
```
a => \nb => \nc => c
```
And respondes with an ordered sequence of the jobs that takes into accoun the dependecies. For example in this case:  `a, c, b`

Read usage to see how to call methods.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'OTB-test'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install OTB-test

## Usage

The usage of the gem methods is the same in terminal or in project.

You can also run the tests to see everything is passing! Skip to section ##Test to do this.

###Queue Class Usage
The purpose of this class is to create queues and then sort them.
As such there are two public methods:
 - Initialization with `new`
 and
 - sorting according to dependecies `sort_sequence` on a Queue object

####Creating a new Queue
```
  OTB::Queue.new(string: 'a =>')
```
returns:
```
  => #<OTB::Queue:0x00007f8433d04260 @jobs="a =>", @jobs_parsed={"a"=>""}>
```
An OTB::Queue with @jobs and @jobs_parsed available

####Sorting a Queue
```
  new_queue = OTB::Queue.new(string: 'a =>')
  new_queue.sort_sequence
```
returns:
```
  => "a"
```
A string witht the sequence of the jobs ordered.


###Job Class - Currently only parse implemented
Job Class exists to parse strings of jobs into Hashes of jobs with dependencies.
Further releases will allow you to store individial job objects and create several from a string.
####Parsing jobs
```
  OTB::Job.parse('a => \nb => \nc =>')
```
returns:
```
  => {"a"=>"", "b"=>"", "c"=>""}
```
A Hash with keys being the jobs and values the dependencies.

## Loading to terminal

From terminal open your ruby console:

    $ irb

Then load the file `lib/otb.rb`:

    $ pry(main)> load 'lib/otb.rb'

It should return `true`.

Then you can:

    $ pry(main)>  OTB::Queue.new(string: 'a =>').sort_sequence


## Testes

There are 17 test.
 - 8 testing the Job class, mostly the `parse` method.
 - 9 testing the Queue class, checking that exections are raised and that the queuer

Inside the OTB-test directory execute:

    $ rake spec

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/OTB-test. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OTB::Test project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/OTB-test/blob/master/CODE_OF_CONDUCT.md).
