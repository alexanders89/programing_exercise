require './lib/report'

describe Report do

  context 'initialize' do
    it 'it is created with a potential URL' do
      report = Report.new('http://bbc.co.uk/')
      expect(report.url).to eq 'http://bbc.co.uk/'
    end

    it 'it can be initialized with an invalid Url' do
      report = Report.new('bad://address')
      expect(report.url).to eq 'bad://address'
    end
  end

  context 'valid' do
    it 'can check the validity of a given url' do
      report = Report.new('http://bbc.co.uk/')
      report2 = Report.new('https://pets4homes.co.uk/images/articles/1646/large/kitten-emergencies-signs-to-look-out-for-')
      expect(report.valid).to eq true
      expect(report2.valid).to eq true
    end

    it 'can check an invalid url' do
      report = Report.new('bad://address')
      expect(report.valid).to eq false
    end

    it 'can check an invalid address' do
      report = Report.new('http://www.bbc.co.uk/missing/thing')
      expect(report.get_code).to eq 404
    end

  end

  context 'status codes' do
    it 'will return the status code of a given url' do
      report = Report.new('http://bbc.co.uk/')
      expect(report.get_code).to eq 200
    end
    it 'will return the status code of an invalid url' do
      report = Report.new('bad://address')
      expect(report.get_code).to eq "Invalid Url"
    end
  end

  context 'date' do
    it 'will return the date the request was made' do
      report = Report.new('http://bbc.co.uk/')
      expect(report.get_date).to include report.current_time
    end
    it 'will return an invalid url' do
      report = Report.new('bad://address')
      expect(report.get_date).to eq "Invalid Url"
    end
  end

  context 'content length' do
    it 'will return the integer content length of the request' do
      report = Report.new('http://bbc.co.uk/')
      expect(report.get_content_length.to_i).to be_between(300000, 400000)
    end
    it 'will return the integer content length of the request' do
      report = Report.new('bad://address')
      expect(report.get_content_length).to eq "Invalid Url"
    end
  end

  context 'printing' do
    it 'will print the output in json format' do
      report = Report.new('http://bbc.co.uk/')
      report.print_output
      expect(report.output).to include "Url" && "Status_code"
    end
    it 'will print the invalid output in json format' do
      report = Report.new('bad://address')
      report.print_output
      expect(report.output).to include "{\n  \"Url\": \"bad://address\",\n  \"Error\": \"Invalid URL\"\n}"
    end
  end
end
