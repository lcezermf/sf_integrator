require 'spec_helper'
require_relative '../lib/sf_integrator/lead.rb'

describe SfIntegrator::Lead do
  subject(:lead) { described_class.new }

  it { expect(lead).to be_an_instance_of(SfIntegrator::Lead) }
end
