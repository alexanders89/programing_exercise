require './lib/multireport'

describe Multireport do
  it "it can load a list of multiple url's" do
    report = Multireport.new
    expect(report.list).to include "http://www.bbc.co.uk/iplayer"
  end

  it 'will not add or remove any new urls' do
    report = Multireport.new
    report.run_list
    expect(report.list.count).to eq 9
  end

  it 'cannot be run twice' do
    report = Multireport.new
    report.run_list
    expect{ report.run_list }.to raise_error "Cannot run twice"
  end
end
