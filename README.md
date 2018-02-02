# Screener - Robert Rawlins

> This Ruby/Rake task accepts a text file of customers (JSON Encoded), finds all those within [X]km of a given location, sorts them by their ID in ascending order and outputs them back into the same format in which they arrived.
>
> **By default it filters for customers within 100km of the Dublin HQ.**

### Requirements

This was written and tested using **Ruby 2.4.3**, it should work with other versions but they are untested.

### Installing

1. Clone this projects Github repository `git clone https://github.com/SirRawlins/screener.git`.
2. Navigate into the directory.
3. Run `bundle install` to ensure all the dependencies are installed.

### Running

##### Default/Required Arguments

The task at minimum takes the relative file path of the file you want to process, and will export the filtered customers to _/invitees.json_ in the directory from which it was run.

```
rake customers:create_invite_list['/spec/fixtures/customers.json']
```

##### Optional Arguments

The task also includes additional ordered arguments, should you wish to change the export file path or the location and distance for which you wish to filter customers.

```
rake customers:create_invite_list[:input_path, :output_path, :within, :of]
```

The `of` argument is a string, which contains lat/long coordinates separated by a space. `'53.339428 -6.257664'`

### Testing

The task and it's supporting code are fully tested, tests can be run using `rspec .`, we also ensure conformance to the Ruby Styleguide using Rubocop, conformance can be run using `rubocop`
