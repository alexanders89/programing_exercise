# require_relative 'report'
#
# class Multireport
#
#   attr_accessor :list
#
#   def initialize
#     @list = list
#   end
#
#   def run_list
#     @owliver = []
#     @list.each_with_index do |url, index|
#       index = Report.new(url)
#       @owliver << index
#     end
#     @owliver.each do |url|
#       puts url.get_code
#     end
#   end
#
#   def load_list
#     @list = []
#     file = File.open("sample_data.txt", "r")
#     file.readlines.each do |line|
#       list << line.chop
#     end
#     file.close
#   end
# end
#
# report = Multireport.new
# report.load_list
# report.run_list
