# AssistSingleAssociation

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'assist_single_association'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install assist_single_association
```

## Usage

If you exclude AssistSingleAssociation in some model class defined `has_one` option, The class make automatically `build_[enum_key]_[relation_name]` methods.

For example
```ruby

class User < ActiveRecord

  has_one :payment

  exclude AssistSingleAssociation
end

class Payment < ActiveRecord

  belongs_to :user
  
  enum status: {
    pending: 0,
    paid: 1
  }
end

user = User.first

user.build_pending_payment

=> #<Payment:0x00007f87a9ae5910 id: nil, user_id: 1, status: "pending">

user.create_paid_payment

=> #<Payment:0x00007f87a9ae5910 id: 1, user_id: 1, status: "paid">
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
