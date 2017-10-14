require 'addressable/uri'
require 'rest-client'


class Report

  SCHEMES = %w(http https)

  attr_accessor :url

  def initialize(url)
    @url = url
  end

  # expected: 2017-10-14 13:38:03.118789000 +0100
  #           got: "Sat, 14 Oct 2017 12:38:04 GMT"

  def valid_url?
    parsed = Addressable::URI.parse(@url) or return false
    SCHEMES.include?(parsed.scheme)
    rescue Addressable::URI::InvalidURIError
      false
  end

  def get_code
    invalid_url
    response = RestClient.get @url
    response.code
  end

  def get_date
    invalid_url
    response = RestClient.get @url
    response.headers[:date]
  end

  def current_time
    t = Time.now - (60 * 60 + 10)
    t.strftime('%T')[0..4]
  end

  def invalid_url
    raise "Invalid URL" if valid_url? == false
  end



  # def loading_list
  #   @ = []
  #   file = File.open("sample_data.txt", "r")
  #   file.readlines.each do |line|
  #     text << line.chop
  #   end
  #   file.close
  # end

end
