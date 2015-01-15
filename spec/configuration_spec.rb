require 'spec_helper'
require_relative '../lib/sf_integrator/configuration.rb'

describe SfIntegrator::Configuration do
  context 'accessors' do
    [:username, :password, :client_id, :client_secret].each do |field|
      context field.to_s do
        it { expect(subject).to respond_to field }
        it { expect(subject).to respond_to "#{field}=" }
      end
    end
  end

  context '#to_hash' do
    subject { described_class.new }

    it 'match values' do
      subject.username      = 'Luiz'
      subject.password      = '123123123'
      subject.client_id     = '123123123'
      subject.client_secret = '123123123'

      expected = { username: 'Luiz', password: '123123123', client_id: '123123123', client_secret: '123123123' }
      expect(subject.to_hash).to match(expected)
    end
  end
end
