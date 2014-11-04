SpreeNf4web
===========

Nf4web is a brazilian service to issue invoices, according to the
brazilian law, and Serasa regulations. This gem provides the required
API to support the integration.

Installation
------------

Add spree_nf4web to your Gemfile:

```ruby
gem 'spree_nf4web', git: 'git@github.com:alexandremcosta/spree_nf4web.git', branch: '2-1-stable'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_nf4web:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_nf4web/factories'
```

Documentation
-------------
```
Nf4web::StateList
  #initialize
    when argument doesnt implement state_machine
      should throw an error
  #with_index
    should return a hash of states and indexes
```

Copyright
---------

Copyright (c) 2014 [name of extension creator], released under the New BSD License
