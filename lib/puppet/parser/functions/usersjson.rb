require "net/http"
require "uri"
require "json"

module Puppet::Parser::Functions
  newfunction(:usersjson, :type => :rvalue, :doc => "Get users from SIA") do |args|
    uri = URI(args[0])
    Net::HTTP.start(
      uri.host, 
      uri.port, 
      :use_ssl => uri.scheme == 'https',
      :verify_mode => OpenSSL::SSL::VERIFY_NONE
    ) do |http|
      
      request = Net::HTTP::Get.new uri.request_uri

      response = http.request request # Net::HTTPResponse object

      hash = JSON.parse(response.body)
      
      # Use puts hash to debug here
      return hash

    end
  end
end
