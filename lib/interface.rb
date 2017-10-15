require './report'
require './multireport'
require 'terminal-table'
require 'colorize'

@list = []
@table = []

def interactive_menu
  clear_screen
  loop do
    puts "===================="
    puts "1. Check Individual URL"
    puts "2. Check Multiple URL"
    puts "3. Load URL list"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      get_url
    when "2"
      check_multi_url
    when "3"
      load_list
    when "9"
      exit
    end
  end
end

def get_url
  clear_screen
  puts "Enter URL:"
  report = Report.new(gets.chomp)
  report.print_output
  puts report.output
end

def check_multi_url
  clear_screen
  puts "Enter URL, to finish press return twice."
  url = gets.chomp
    while !url.empty? do
      puts "#{url} has been added"
      @list << url
      puts "Enter URL, to finish press return twice."
      url = gets.chomp
    end
    puts "You have added #{@list.count} URL's to check"
    puts @list
    sleep(2)
    run_urls
    @list = []
end

def run_urls
  @list.each do |url|
    report = Report.new(url)
    @table << [report.url, report.get_code, report.get_content_length, report.get_date]
    report.print_output
    puts report.output
  end
  build_table
  @table = []
  @list = []
end

def load_list
  puts 'Choose a list to open'
  files = Dir.entries('../sample_data')
  files.each {|file| puts file[0, file.index('.')]}
  file_to_load = gets.chomp
  file = File.open("../sample_data/#{file_to_load}.txt", "r")
  file.readlines.each do |line|
    @list << line.chop
  end
  file.close
  run_urls
end

def build_table
  rows = []
  @table.each { |url, code, length, date| rows << [
    url, code, length, date] }
    table = Terminal::Table.new :headings => ['Url'.red, 'Code'.red, 'Content Length'.red, 'Date'.red],
    :rows => rows
    puts table
end

def clear_screen
  puts "\e[H\e[2J"
end


interactive_menu
