require './report'

def interactive_menu
  loop do
    puts "===================="
    puts "1. Check Individual URL"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      get_url
    when "9"
      exit
    end
  end
end

def get_url
  puts "Enter URL:"
  @report = Report.new(gets.chomp)
end

def request_url
  
end

interactive_menu
