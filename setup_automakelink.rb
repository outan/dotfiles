#!/usr/bin/env ruby
#-*- encoding:utf-8 -*-
=begin
カレントディレクトリにある .から始まるdotfile(ディレクトリも可)をHOME以下にシンボリックリンクします。
Ruby1.9用 (JRuby --1.9 でも動作可能)
=end

puts "このスクリプトはdotfilesの中で実行してください。"
print "実行しますか？[y/n]:"
a = STDIN.gets().chomp
unless a == "y" or a == "yes" then
	puts "exit."
	exit 0
end

dirfiles = `ls -a`
dotfiles = Array.new

dirfiles.each_line do |line|
	dotfiles << line if line =~ /^\..+$/ and line !~ /^\.\..*/ and line !~ /\.git$/ and line !~ /\.config$/ and line !~ /\.DS_Store$/
end

print "以下のファイルとディレクトリをHOME以下にリンクします\n\n"
dotfiles.each do |f|
	puts f
end
print "\nOK?[y/n]:"
a = STDIN.gets().chomp
unless a == "y" or a == "yes" then
	puts "exit."
	exit 0
end

dotfiles.each do |fd|
	begin
		c = File.symlink(File.expand_path(fd.chomp),File.expand_path("~/#{fd.chomp}"))
	rescue Errno::EEXIST => e
                puts "#{fd.chomp} is already exists.  [SKIP]"
		next
	end
	puts "Create #{fd} " if c == 0
end

puts "Finished."
