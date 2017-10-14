require 'addressable/uri'
require 'rest-client'
require 'json'


class Report

  SCHEMES = %w(http https)

  attr_accessor :url, :valid, :output

  def initialize(url)
    @url = url
    @valid = valid_url?
    @output = output
  end

  def valid_url?
    parsed = Addressable::URI.parse(@url) or return false
    SCHEMES.include?(parsed.scheme)
    rescue Addressable::URI::InvalidURIError
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

  def get_content_length
    invalid_url
    response = RestClient.get @url
    response.headers[:content_length]
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

  def invalid_url
    raise "Invalid URL" if @valid == false
  end

end
