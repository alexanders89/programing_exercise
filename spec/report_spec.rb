require './lib/report'

describe Report do

  context 'initialize' do
    it 'it is created with a potential URL' do
      report = Report.new('http://bbc.co.uk/')
      expect(report.url).to eq 'http://bbc.co.uk/'
    end
  end

  context 'validity' do
    it 'cam check the validity of a given url' do
      report = Report.new('http://bbc.co.uk/')
      report2 = Report.new('https://pets4homes.co.uk/images/articles/1646/large/kitten-emergencies-signs-to-look-out-for-')
      expect(report.valid_url?).to eq true
      expect(report2.valid_url?).to eq true
    end

    it 'will fail if it is not a valid url' do
      report = Report.new('bad://address')
      expect(report.valid_url?).to eq false
    end
  end

  context 'status codes' do
    it 'will return the status code of a given url' do
      report = Report.new('http://bbc.co.uk/')
      expect(report.get_code).to eq 200
    end

    it 'will not try to run an invalid url' do
      report = Report.new('bad://address')
      expect{ report.get_code }.to raise_error "Invalid URL"
    end
  end

  context 'date' do
      it 'will return the date the request was made' do
      report = Report.new('http://bbc.co.uk/')
      expect(report.get_date).to include report.current_time
    end

    it 'will not return the date an invalid request was made' do
      report = Report.new('bad://address')
      expect{ report.get_date }.to raise_error "Invalid URL"
    end
  end

  context 'content length' do
      it 'will return the integer content length of the request' do
      report = Report.new('http://bbc.co.uk/')
      expect(report.get_content_length.to_i).to be_between(300000, 400000)
    end

    it 'will not return the content length of an invalid url' do
      report = Report.new('bad://address')
      expect{ report.get_content_length }.to raise_error "Invalid URL"
    end
  end

end
