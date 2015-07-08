require 'spec_helper'
require_relative '../lib/sf_integrator/lead.rb'

describe SfIntegrator::Lead do
  let(:attributes) {
    { first_name: 'Cezer', last_name: 'Filho', email: 'luiz.cezer@yahoo.com.br', company: 'Google', job_title: 'Developer', phone: '5555555', website: 'http://github.com/lccezinha' }
  }
  subject(:lead) { described_class.new(attributes) }

  context 'be instance of SfIntegrator::Lead' do
    it { expect(lead).to be_an_instance_of(SfIntegrator::Lead) }
  end

  it { expect(lead).to respond_to(:create) }
  it { expect(described_class).to respond_to(:all) }
  it { expect(described_class.ancestors).to include(ActiveModel::Validations) }

  context 'accessors' do
    [:first_name, :last_name, :email, :company, :job_title, :phone, :website].each do |attribute|
      context attribute.to_s do
        it { expect(lead).to respond_to attribute }
        it { expect(lead).to respond_to "#{attribute}=" }
      end
    end
  end

  it 'match values' do
    expect(lead.first_name).to eql('Cezer')
    expect(lead.last_name).to eql('Filho')
    expect(lead.email).to eql('luiz.cezer@yahoo.com.br')
    expect(lead.company).to eql('Google')
    expect(lead.job_title).to eql('Developer')
    expect(lead.phone).to eql('5555555')
    expect(lead.website).to eql('http://github.com/lccezinha')
  end

  context 'validations' do
    context 'presence_of' do
      [:first_name, :last_name, :email, :company, :job_title, :phone, :website].each do |attribute|
        it attribute.to_s do
          lead.send("#{attribute}=", '')
          expect(lead).not_to be_valid
        end
      end
    end
  end

  context '#all' do
    it 'return an array' do
      expect(SfIntegrator::Lead.all).to be_an_instance_of(Array)
    end
  end

  context 'create new lead' do
    context 'when success' do
      it do
        result = lead.create

        expect(result).to match(/[a-z]|[A-Z]|[0-9]/)
      end
    end

    context 'when fail' do
      let(:attributes) { { first_name: 'Cezer' } }
      subject(:fail_lead) { described_class.new(attributes) }

      it do
        result = fail_lead.create

        expect(result).to eq(false)
      end
    end
  end
end
