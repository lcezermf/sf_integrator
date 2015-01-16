require 'active_model'

module SfIntegrator
  class Lead
    include ActiveModel::Validations

    validates :first_name, :last_name, :email, :company, :job_title, :phone, :website, presence: true
    # validates :first_name, :last_name, :company, :job_title, format: { with: /\w/ }

    attr_accessor :client, :first_name, :last_name, :email, :company, :job_title, :phone, :website

    def initialize
      @client = Restforce.new(SfIntegrator::Integrator.configs.to_hash)
    end

    def create
      params = build_params
      client.create('Lead', params)
    end

    private

    def build_params
      { FirstName: first_name, LastName: last_name, Email: email, Company: company, Title: job_title, Phone: phone, Website: website }
    end

  end
end
