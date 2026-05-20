require 'json'

def merge_json_files(3-read_file, 4-write_file)
  file1 = File.read(3-read_file)
  file2 = File.read(3-write_file)

  data1 = JSON.parse(file1)
  data2 = JSON.parse(file2)

  merged = data2 + data1

  File.write(file2_path, JSON.generate(merged))
end
