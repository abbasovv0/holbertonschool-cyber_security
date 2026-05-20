require 'net/http'
require 'json'

def get_request(url)
  uri = URI(url)
  response = Net::HTTP.get_response(uri)

  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"
  
  parsed = JSON.parse(response.body)
  if parsed.empty?
    puts "{}"
  else
    puts JSON.pretty_generate(parsed)
  end
end
