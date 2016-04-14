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

    module ClassMethods

      def url_to(container_name = nil, verb = nil)
        return Console.api_url if container_name.nil?
        "#{Console.api_url}/#{container_name}/#{verb}"
      end

      def get(url)
        Request.get(url)
      end

      def post(url, params)
        Request.post(url, params)
      end

    end
  end

end