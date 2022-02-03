module ForceDomain
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if allowed_domains.any? && !allowed_domains.include?(env['HTTP_HOST'])
        [301, {'Location' => new_location(env), 'Content-Type' => 'text/html', 'Content-Length' => '0'}, []]
      else
        @app.call(env)
      end
    end

    private

      def allowed_domains
        ENV['APP_DOMAIN'].to_s.split(',').map(&:strip)
      end

      def new_location(env)
        scheme = env['rack.url_scheme']
        domain = allowed_domains.first
        path = env['PATH_INFO']
        query_string = env['QUERY_STRING'].to_s

        location = "#{scheme}://#{domain}#{path}"
        location << "?#{query_string}" unless query_string.empty?

        location
      end
  end
end