module SfIntegrator
  class Configuration
    class << self
      attr_accessor :username, :password, :client_id, :client_secret

      def config
        yield self
      end
    end
  end
end

