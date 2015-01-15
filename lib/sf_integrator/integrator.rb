require 'singleton'

module SfIntegrator
  class Integrator
    include Singleton

    attr_accessor :configs

    def self.configure
      instance.configs = SfIntegrator::Configuration.new
      yield instance.configs
    end

    def self.configs
      instance.configs
    end

  end
end
