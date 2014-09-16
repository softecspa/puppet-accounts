#
# usersjson.rb
#

#require 'rubygems'
require 'json'
module Puppet::Parser::Functions

newfunction(:usersjson, :type => :rvalue, :doc => "") do |args|
    response = Net::HTTP.get_response(args[0],args[1])
    data = response.body
    hash = JSON.parse(data)
    return hash
end

end
