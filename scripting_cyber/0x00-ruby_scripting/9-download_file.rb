require 'open-uri'
require 'uri'
require 'fileutils'

# Check if exactly two arguments are passed (URL and Local Path)
if ARGV.length != 2
  puts "Usage: #{File.basename($0)} URL LOCAL_FILE_PATH"
  exit 1
end

url = ARGV[0]
local_path = ARGV[1]

# Optional: Validate URL format
begin
  URI.parse(url)
rescue URI::InvalidURIError
  puts "Error: Invalid URL format provided."
  exit 1
end

puts "Downloading file from #{url}..."

begin
  # Ensure the destination directory exists before writing
  dir = File.dirname(local_path)
  FileUtils.mkdir_p(dir) unless File.directory?(dir)

  # Open the URL and stream the content into the local file
  URI.open(url) do |remote_file|
    File.open(local_path, "wb") do |local_file|
      local_file.write(remote_file.read)
    end
  end

  puts "File downloaded and saved to #{local_path}."

rescue StandardError => e
  puts "An error occurred during download: #{e.message}"
  exit 1
end
