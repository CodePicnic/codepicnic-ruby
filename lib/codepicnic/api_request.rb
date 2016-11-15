module CodePicnic
  module APIRequest
    def self.included(klass)
      klass.extend ClassMethods
    end

    def url_to(container_name = nil, verb = nil)
      self.class.url_to(container_name, verb)
    end

    def get(url)
      self.class.get(url)
    end

    def post(url, params = {})
      self.class.post(url, params)
    end

    def post_form(url, params = {})
      self.class.post_form(url, params)
    end

    module ClassMethods

      def url_to(container_name = nil, verb = nil)
        return Console.api_url if container_name.nil?
        url = "#{Console.api_url}/#{container_name}"
        url << "/#{verb}" if verb
        url
      end

      def get(url)
        Request.get(url)
      end

      def post(url, params)
        Request.post(url, params)
      end

      def post_form(url, params)
        Request.post_form(url, params)
      end

    end
  end

end