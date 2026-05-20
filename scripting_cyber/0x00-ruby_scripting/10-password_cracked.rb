require 'digest'

# Check if exactly two arguments are passed (Hash and Dictionary File)
if ARGV.length != 2
  puts "Usage: #{File.basename($0)} HASHED_PASSWORD DICTIONARY_FILE"
  exit 1
end

target_hash = ARGV[0].downcase.strip
dictionary_file = ARGV[1]

# Ensure the dictionary file exists before opening
unless File.exist?(dictionary_file)
  puts "Error: Dictionary file '#{dictionary_file}' not found."
  exit 1
end

password_found = nil

begin
  # Read the dictionary line by line to keep memory usage low
  File.foreach(dictionary_file) do |line|
    # Strip newline characters and whitespace from the word
    word = line.strip
    next if word.empty?

    # Generate the SHA-256 hash of the current word
    current_hash = Digest::SHA256.hexdigest(word)

    # Compare the hashes
    if current_hash == target_hash
      password_found = word
      break
    end
  end

  if password_found
    puts "Password found: #{password_found}"
  else
    puts "Password not found in dictionary."
  end

rescue StandardError => e
  puts "An error occurred: #{e.message}"
  exit 1
end
