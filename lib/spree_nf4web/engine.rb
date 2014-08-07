module SpreeNf4web
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_nf4web'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    initializer 'add_cpf_to_permitted_attributes' do |app|
      %w{cpf neighborhood}.each do |attr|
        Spree::PermittedAttributes.address_attributes << attr
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
