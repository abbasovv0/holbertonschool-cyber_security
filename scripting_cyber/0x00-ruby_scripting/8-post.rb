require 'net/http'
require 'uri'
require 'json'

def post_request(url, body_params = {})
  uri = URI.parse(url)

  begin
    # Create the HTTP POST request object
    request = Net::HTTP::Post.new(uri)
    
    # Set the content type to JSON
    request['Content-Type'] = 'application/json'
    
    # Convert the ruby hash directly into a JSON string to preserve numbers/types
    request.body = body_params.to_json

    # Execute the request inside an HTTP session
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end

    # Print the status code and description
    puts "Response status: #{response.code} #{response.message}"
    puts "Response body:"
    puts response.body

  rescue StandardError => e
    puts "An error occurred during the POST request: #{e.message}"
  end
end
