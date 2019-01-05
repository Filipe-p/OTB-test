RSpec.describe 'OTB - test & exceptions' do
  it "has a version number" do
    expect(OTB::Test::VERSION).not_to be nil
  end

  it "Passed nothing, the result should be an error that jobs has not been defined" do
    expect{OTB::Queue.new().sort_sequence}.to raise_error(JobQueueError)
  end

  it "Given the following job structure: " + 'a => \nb => \nc => c' do
    expect{OTB::Queue.new(
          jobs: 'a => \nb => \nc => c').sort_sequence}.to raise_error(JobQueueError)
  end

  it "Given the following job structure: " + 'a => \nb => c \nc => f \nd => a \ne => \nf => b' do
    expect{OTB::Queue.new(
          jobs: 'a => \nb => c \nc => f \nd => a \ne => \nf => b').sort_sequence}.to raise_error(JobQueueError)
  end

end

RSpec.describe 'OTB::Queue and sequencing' do

  it "Passed an empty string (no jobs), the result should be an empty sequence." do
    expect(OTB::Queue.new(jobs: '').sort_sequence).to eq('')
  end

  it "Given the following job structure: 'a =>'" do
    expect(OTB::Queue.new(
      jobs: 'a =>').sort_sequence).to eq('a')
  end

  it "Given the following job structure: " + 'a => \nb => \nc =>' do
    expect(OTB::Queue.new(
      jobs: 'a => \nb => \nc =>').sort_sequence).to eq('a, b, c')
  end

  it "Given the following job structure: 'a => \nb => c \nc =>'" do
    expect(OTB::Queue.new(
      jobs: 'a => \nb => c \nc =>').sort_sequence).to eq('a, c, b')
  end

  it "Given the following job structure: " + 'a => \nb => c \nc => f \nd => a \ne => b \nf =>' do
    expect(OTB::Queue.new(
      jobs: 'a => \nb => c \nc => f \nd => a \ne => b \nf =>').sort_sequence).to eq('a, f, c, b, d, e')
  end

end
