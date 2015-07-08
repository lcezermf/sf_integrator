module SfIntegrator
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def copy_initializer
      template 'sf_integrator.rb', 'config/initializers/sf_integrator.rb'
    end
  end
end

