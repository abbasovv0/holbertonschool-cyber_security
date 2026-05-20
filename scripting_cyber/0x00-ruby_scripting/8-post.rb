require 'net/http'
require 'uri'

def post_request(url, body_params = {})
  # Parse the string URL into a URI object
  uri = URI.parse(url)

  begin
    # Make the HTTP POST request using form-encoded parameters
    response = Net::HTTP.post_form(uri, body_params)

    # Print the status code and text description (e.g., "201 Created")
    puts "Response status: #{response.code} #{response.message}"
    puts "Response body:"
    puts response.body

  rescue StandardError => e
    puts "An error occurred during the POST request: #{e.message}"
  end
end
