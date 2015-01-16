require 'active_model'

module SfIntegrator
  class Lead
    include ActiveModel::Validations

    validates :first_name, :last_name, :email, :company, :job_title, :phone, :website, presence: true

    attr_accessor :first_name, :last_name, :email, :company, :job_title, :phone, :website

    def initialize(args)
      @first_name = args[:first_name]
      @last_name  = args[:last_name]
      @email      = args[:email]
      @company    = args[:company]
      @job_title  = args[:job_title]
      @phone      = args[:phone]
      @website    = args[:website]
    end

    def create
      params = map_attributes
      self.class.client.create('Lead', params)
    end

    def self.all
      records = client.query('select FirstName, LastName, Email, Company, Title, Phone, Website from Lead')
      records.map do |record|
        Lead.new({ first_name: record.FirstName, last_name: record.LastName, email: record.Email, company: record.Company, job_title: record.Title, phone: record.Phone, website: record.Website })
      end
    end

    private

    def self.client
      @client ||= Restforce.new(SfIntegrator::Integrator.configs.to_hash)
    end

    def build_params(record)

    end

    # Map attributes from SalesForce convention
    def map_attributes
      { FirstName: first_name, LastName: last_name, Email: email, Company: company, Title: job_title, Phone: phone, Website: website }
    end

  end
end
