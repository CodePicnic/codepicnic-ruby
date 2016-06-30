require 'json'
require 'rest_client'
require 'codepicnic/api_request'
require 'codepicnic/token'
require 'codepicnic/request'
require 'codepicnic/console'
require 'codepicnic/version'

module CodePicnic

  class << self
    attr_accessor :client_id, :client_secret, :token

    def token
      @token ||= get_token
      refresh_token if @token.expired?
      @token.access_token
    end

    def refresh_token
      @token = get_token
    end

    def get_token
      Token.new(@client_id, @client_secret)
    end

  end

end