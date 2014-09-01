module ForceDomain
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if ENV['APP_DOMAIN'] && env['HTTP_HOST'] != ENV['APP_DOMAIN']
        [301, {'Location' => new_location(env), 'Content-Type' => 'text/html', 'Content-Length' => '0'}, []]
      else
        @app.call(env)
      end
    end

    private

      def new_location(env)
        scheme = env['rack.url_scheme']
        domain = ENV['APP_DOMAIN']
        path = env['PATH_INFO']
        query_string = env['QUERY_STRING'].to_s

        location = "#{scheme}://#{domain}#{path}"
        location << "?#{query_string}" unless query_string.empty?

        location
      end
  end
end