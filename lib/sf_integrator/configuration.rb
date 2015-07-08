module SfIntegrator
  class Configuration
    attr_accessor :username, :password, :client_id, :client_secret

    def to_hash
      { username: username, password: password, client_id: client_id, client_secret: client_secret  }
    end
  end
end
