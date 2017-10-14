require './report'

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
    puts 'Please enter the number dish you would like to order'
    index = gets.chomp
    while !index.empty? do
      puts 'Please enter the quantity'
      quantity = gets.chomp.to_i
      puts "#{quantity} x #{@students[index.to_i - 1][:name]} have been added to your basket"
      @basket << [@students[(index.to_i) -1][:name], quantity, @students[(index.to_i) - 1][:price]]
      puts 'Please enter the number dish you would like to order'
      index = gets.chomp
    end

end

interactive_menu
