# SfIntegrator

Simple integration with salesforce leads.

## Installation

Add this line to your application's Gemfile:

    gem 'sf_integrator', '1.0.1'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sf_integrator

## Configuration

First, create a new file `sf_integrator.rb` in `config/initializers` path.

In this file, you put this template config:

```ruby
SfIntegrator::Integrator.configure do |config|
  config.username = 'YOUR_SALESFORCE_EMAIL'
  config.password = 'YOUR_SALESFORCE_PASSWORD + YOUR_SALESFORCE_SECURITY_TOKEN'
  config.client_id = 'YOUR_CUSTOMER_KEY'
  config.client_secret = 'YOUR_CLIENT_SECRET'
end
```

It is importante change the values of the keys for your credentials

## Usage

After that you create a simple ruby class in `models` directory, this class must inherits from `SfIntegrator::Lead`

```ruby
class Lead < SfIntegrator::Lead
end
```

In you controller:

```ruby
  # app/controllers/leads_controller.rb

  def index
    @leads = Lead.all
  end

  def new
  end

  def create
    params = { first_name: 'Cezer', last_name: 'Filho', email: 'luiz.cezer@yahoo.com.br', company: 'Google', job_title: 'Developer', phone: '5555555', website: 'http://github.com/lccezinha' }
    @lead = Lead.new(params)
    @lead.create
  end
```

The fields `first_name, last_name, email, company, job_title, phone, website` are all required.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/sf_integrator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
