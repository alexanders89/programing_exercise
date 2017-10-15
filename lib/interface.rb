require './report'

@list = []

def interactive_menu
  loop do
    puts "===================="
    puts "1. Check Individual URL"
    puts "2. Check Multiple URL"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      get_url
    when "2"
      check_multi_url
    when "9"
      exit
    end
  end
end

def get_url
  puts "Enter URL:"
  report = Report.new(gets.chomp)
  report.print_output
  puts report.output
end

def check_multi_url
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
    report.print_output
    puts report.output
  end
end

interactive_menu
