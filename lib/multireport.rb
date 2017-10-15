require_relative 'report'

class Multireport

  attr_accessor :list

  def initialize
    @list = load_list
    @run = false
  end

  def run_list
    raise "Cannot run twice" if @run == true
    @list = @list.map do |url|
      report = Report.new(url)
    end
    @run = true
  end

  def load_list
    list = []
    file = File.open("sample_data.txt", "r")
    file.readlines.each do |line|
      list << line.chop
    end
    file.close
    list
  end
end
