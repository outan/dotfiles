#!/usr/bin/env ruby

require 'readline'
def prompt(prompt="> ")
  input = nil
  prompt += " " unless prompt =~ /\s$/
  loop do
    input = Readline.readline(prompt)
    break if input.length > 0
  end
  return input
end  

remote  = ARGV[0]
dry_run = ARGV.include?(/"--dry-run" | "-n"/) 

if !remote || remote == "--dry-run" || remote == "-n"
  puts "no remote specified, assuming 'origin'"
  remote = "origin"
end

local_tags  = `git tag`.split("\n")
remote_tags = []

remote_tag_details = `git ls-remote --tags #{remote}`.split("\n")
remote_tag_details.each do |details|
  sha, tag = details.split("\t")  
  next if tag[-3, 3] == "^{}"
  remote_tags << tag.gsub(%r(^refs/tags/), '')
end

delete_tags = []
local_tags.each do |local_tag|
  next if remote_tags.include?(local_tag)
  puts "local tag '#{local_tag}' not found in '#{remote}'"
  delete_tags << local_tag
end

if delete_tags.empty?
  abort "No tags found locally which aren't on '#{remote}'"
end

if dry_run
  puts "#{delete_tags.size} tags would have been deleted, run without --dry-run to do the deed"
else
  response = prompt("Are you sure you want to delete these tags? (yn)")
  if response.downcase.strip =~ /^y/
    delete_tags.each do |local_tag|
      `git tag -d #{local_tag}`  
    end

    puts "#{delete_tags.size} tags have been deleted"  
  else
    puts "Aborted"
  end    
end
