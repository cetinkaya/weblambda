# weblambda
A Ruby Sinatra extension that helps you create web forms from given anonymous functions


## Installation

Create a Gemfile

```ruby
source 'https://rubygems.org'

gem 'sinatra'
gem 'weblambda', git: 'https://github.com/cetinkaya/weblambda'
```

If you want to install locally, run (in terminal)

```sh
bundle config --local path 'vendor/bundle'
bundle config --local cache_path '.bundle/cache'
```

Then install, by running

```sh
bunlde install -j 4
```

## Example use

Here is an example code that creates on path '/calculate' a web form with two text input fields: `a` and `b`. When the form is submitted, `a` and `b` are treated as floating point numbers and the result of `a+b` is shown on '/calculateresult'.

```ruby
require 'sinatra'
require 'weblambda'

web_lambda('calculate') do |a, b|
  "#{a.to_f + b.to_f}"
end
```

After running this code, you can check `http://localhost:4567/calculate`. Make sure you also install a handler like 'puma' or 'webrick'. 
