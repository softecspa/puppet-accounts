# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
require "net/http"
require "uri"
require "json"

# ---- original file header ----
#
# @summary
#   Get users from SIA
#
Puppet::Functions.create_function(:'accounts::usersjson') do
  # @param args
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :args
  end


  def default_impl(*args)
    
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