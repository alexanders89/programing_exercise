require './lib/multireport'

describe Multireport do
  subject(:multireport) {described_class.new}

  it "it can load a list of multiple url's" do
    expect(multireport.list).to include "http://www.bbc.co.uk/iplayer"
  end

  it 'will not add or remove any new urls' do
    subject.run_list
    expect(multireport.list.count).to eq 9
  end

  it 'cannot be run twice' do
    subject.run_list
    expect{ multireport.run_list }.to raise_error "Cannot run twice"
  end
end
