#!/usr/bin/env ruby
require 'optparse'

FILE = 'tasks.txt'

OptionParser.new do |opts|
  opts.banner = 'Usage: cli.rb [options]'
  opts.on('-a', '--add TASK',    'Add a new task')        { |t| File.write(FILE, t + "\n", mode: 'a'); puts "Task '#{t}' added." }
  opts.on('-l', '--list',        'List all tasks')        { puts 'Tasks:'; File.exist?(FILE) ? File.readlines(FILE, chomp: true).each_with_index { |t, i| puts "#{i+1}. #{t}" } : puts('No tasks.') }
  opts.on('-r', '--remove INDEX','Remove a task by index') { |i| tasks = File.readlines(FILE, chomp: true); removed = tasks.delete_at(i.to_i - 1); File.write(FILE, tasks.join("\n") + "\n"); puts "Task '#{removed}' removed." }
  opts.on('-h', '--help',        'Show help')             { puts opts; exit }
end.parse!
