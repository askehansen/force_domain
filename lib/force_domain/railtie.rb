module ForceDomain
  class Railtie < Rails::Railtie
    initializer "force_domain.configure_rails_initialization" do
      Rails.application.middleware.insert_before 0, ForceDomain::Middleware
    end
  end
end
