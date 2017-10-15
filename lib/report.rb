require 'addressable/uri'
require 'HTTParty'
require 'json'


class Report

  SCHEMES = %w(http https)

  attr_accessor :url, :valid, :output, :code, :date

  def initialize(url)
    @url = url
    @valid = valid_url?
    @output = output
    @code = code
    @date = date
  end

  def valid_url?
    parsed = Addressable::URI.parse(@url) or return false
    SCHEMES.include?(parsed.scheme)
    rescue Addressable::URI::InvalidURIError
  end

  def get_code
    if @valid
      response = HTTParty.get @url
      @code = response.code
    else
      return "Invalid Url"
    end
  end

  def get_date
    if @valid
      response = HTTParty.get @url
      @date = response.headers["date"]
    else
      return "Invalid Url"
    end
  end

  def current_time
    t = Time.now - (60 * 60 + 10)
    t.strftime('%T')[0..4]
  end

  def get_content_length
    if @valid
      response = HTTParty.get @url
      response.headers["content-length"]
    else
      return "Invalid Url"
    end
  end

  def print_output
    print_valid_output if @valid == true
    print_invalid_output if @valid == false
  end

  def print_valid_output
    output = { :Url => @url, :Status_code => get_code,
    :Content_length =>get_content_length, :Date => get_date}
    @output = JSON.pretty_generate(output)
  end

  def print_invalid_output
    output = { :Url => @url, :Error => "Invalid URL"}
    @output = JSON.pretty_generate(output)
  end
end
