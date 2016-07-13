require 'json'
require 'rest_client'
require 'codepicnic/api_request'
require 'codepicnic/token'
require 'codepicnic/request'
require 'codepicnic/console'
require 'codepicnic/version'

module CodePicnic

  class << self
    attr_accessor :client_id, :client_secret

    def token
      @token_client ||= get_token
      refresh_token if @token_client.expired?
      @token_client.access_token
    end

    def refresh_token
      @token_client = get_token
    end

    def get_token
      Token.new(@client_id, @client_secret)
    end

  end

end