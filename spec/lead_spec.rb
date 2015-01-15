require 'spec_helper'
require_relative '../lib/sf_integrator/lead.rb'

describe SfIntegrator::Lead do
  subject(:lead) { described_class.new }

  context 'be instance of SfIntegrator::Lead' do
    it { expect(lead).to be_an_instance_of(SfIntegrator::Lead) }
  end

  context 'accessors' do
    [:client, :first_name, :last_name, :email, :company, :job_title, :phone, :website].each do |field|
      context field.to_s do
        it { expect(subject).to respond_to field }
        it { expect(subject).to respond_to "#{field}=" }
      end
    end
  end

  it { expect(subject).to respond_to(:create) }

  it 'match values' do
    lead.first_name = 'Luiz'
    lead.last_name  = 'Cezer'
    lead.email = 'lccezinha@gmail.com'
    lead.company = 'Google'
    lead.job_title = 'Rails Dev'
    lead.phone = '5555555'
    lead.website = 'github.com/lccezinha'

    expect(lead.first_name).to eql('Luiz')
    expect(lead.last_name).to eql('Cezer')
    expect(lead.email).to eql('lccezinha@gmail.com')
    expect(lead.company).to eql('Google')
    expect(lead.job_title).to eql('Rails Dev')
    expect(lead.phone).to eql('5555555')
    expect(lead.website).to eql('github.com/lccezinha')
  end

  context 'create new lead' do
    context 'when success' do
      it do
        lead.first_name = 'Luiz'
        lead.last_name  = 'Cezer'
        lead.email = 'lccezinha@gmail.com'
        lead.company = 'Google'
        lead.job_title = 'Rails Dev'
        lead.phone = '5555555'
        lead.website = 'github.com/lccezinha'

        result = lead.create
        expect(result).to match(/[a-z]|[A-Z]|[0-9]/)
      end
    end

    context 'when fail' do
      it do
        lead.first_name = 'Luiz'

        result = lead.create

        expect(result).to eq(false)
      end
    end
  end
end
