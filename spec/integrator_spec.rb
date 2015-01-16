require 'spec_helper'
require_relative '../lib/sf_integrator/integrator.rb'

describe SfIntegrator::Integrator do
  subject { described_class }

  context 'valid configs' do
    before do
      SfIntegrator::Integrator.configure do |config|
        config.username = 'lccezinha@gmail.com'
        config.password = 'batata880AvOSHd43zql8ZIMJ1emQNjkt'
        config.client_id = '3MVG9xOCXq4ID1uFbfzoMHMM0bGJfUgjThmhEmajKOh75cvDlJn.E3g5FYx2R45vTpFRJfiPDfda5o.td8HQ2'
        config.client_secret = '3340784302062558262'
      end
    end

    it { expect(subject.configs.username).to eql('lccezinha@gmail.com') }
    it { expect(subject.configs.password).to eql('batata880AvOSHd43zql8ZIMJ1emQNjkt') }
    it { expect(subject.configs.client_id).to eql('3MVG9xOCXq4ID1uFbfzoMHMM0bGJfUgjThmhEmajKOh75cvDlJn.E3g5FYx2R45vTpFRJfiPDfda5o.td8HQ2') }
    it { expect(subject.configs.client_secret).to eql('3340784302062558262') }
  end
end
