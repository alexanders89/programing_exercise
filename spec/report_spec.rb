require './lib/report'

describe Report do
  it 'it is created with a potential URL' do
    report = Report.new('http://www.bbc.co.uk/iplayer')
    expect(report.url).to eq 'http://www.bbc.co.uk/iplayer'
  end

  it 'cam check the validity of a given url' do
    report = Report.new('http://www.bbc.co.uk/iplayer')
    report2 = Report.new('https://www.pets4homes.co.uk/images/articles/1646/large/kitten-emergencies-signs-to-look-out-for-')
    expect(report.valid_url?).to eq true
    expect(report2.valid_url?).to eq true
  end

  it 'will fail if it is not a valid url' do
    report = Report.new('bad://address')
    expect(report.valid_url?).to eq false
  end

  it 'will return the status code of a given url' do
    report = Report.new('http://www.bbc.co.uk/iplayer')
    expect(report.code).to eq 200
  end

  it 'will not try to run an invalid url' do
    report = Report.new('bad://address')
    expect{ report.code }.to raise_error "Invalid URL"
  end
end
