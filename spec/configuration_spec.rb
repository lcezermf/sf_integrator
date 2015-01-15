require 'spec_helper'
require_relative '../lib/sf_integrator/configuration.rb'

describe SfIntegrator::Configuration do
  subject { described_class }

  context 'accessors' do
    [:username, :password, :client_id, :client_secret].each do |field|
      context field.to_s do
        it { expect(subject).to respond_to field }
        it { expect(subject).to respond_to "#{field}=" }
      end
    end
  end

  context 'valid configs' do
    before do
      SfIntegrator::Configuration.config do |config|
        config.username = 'lccezinha@gmail.com'
        config.password = 'batata880AvOSHd43zql8ZIMJ1emQNjkt'
        config.client_id = '3MVG9xOCXq4ID1uFbfzoMHMM0bGJfUgjThmhEmajKOh75cvDlJn.E3g5FYx2R45vTpFRJfiPDfda5o.td8HQ2'
        config.client_secret = '3340784302062558262'
      end
    end

    it do
      expect(subject.username).to eql('lccezinha@gmail.com')
      expect(subject.password).to eql('batata880AvOSHd43zql8ZIMJ1emQNjkt')
      expect(subject.client_id).to eql('3MVG9xOCXq4ID1uFbfzoMHMM0bGJfUgjThmhEmajKOh75cvDlJn.E3g5FYx2R45vTpFRJfiPDfda5o.td8HQ2')
      expect(subject.client_secret).to eql('3340784302062558262')
    end
  end
end
