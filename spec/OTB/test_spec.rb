RSpec.describe OTB::Test do
  it "has a version number" do
    expect(OTB::Test::VERSION).not_to be nil
  end

  it "Passed an empty string (no jobs), the result should be an empty sequence." do
    expect(OTB::Queue.new(jobs: '')).to eq('')
  end

  it "Given the following job structure: 'a =>'" do
    expect(OTB::Queue.new(
      jobs: 'a =>')).to eq('a')
  end

  it "Given the following job structure: 'a =>, b =>, c =>'" do
    expect(OTB::Queue.new(
      jobs: 'a =>, b =>, c =>')).to eq('a, b, c')
  end

  it "Given the following job structure: 'a =>, b => c, c =>'" do
    expect(OTB::Queue.new(
      jobs: 'a =>, b => c, c =>')).to eq('a, c, b')
  end

  it "Given the following job structure: 'a =>, b => c, c => f, d => a, e => b, f =>'" do
    expect(OTB::Queue.new(
      jobs: 'a =>, b => c, c => f, d => a, e => b, f =>')).to eq('a, f, c, b, d, e')
  end

  # it "Given the following job structure: 'a =>, b =>, c => c'" do
  #   expect(OTB::Queue.new(
  #     jobs: 'a =>, b => c, c => f, d => a, e => b, f =>').to eq(Error::StandardError)
  # end


  it "Given the following job structure: 'a =>, b =>, c => c'" do
    expect(OTB::Queue.new(
      jobs: 'a =>, b =>, c => c')).to eq('The result should be an error stating that jobs can’t depend on themselves.')
  end

  it "Given the following job structure: 'a =>, b => c, c => f, d => a, e =>, f => b'" do
    expect(OTB::Queue.new(
      jobs: 'a =>, b => c, c => f, d => a, e =>, f => b')).to eq('The result should be an error stating that jobs can’t have circular dependencies.')
  end


  # it "Given the following job structure: 'a =>, b => c, c => f, d => a, e =>, f => b'" do
  #   expect(OTB::Queue.new(
  #     jobs: 'a =>, b => c, c => f, d => a, e =>, f => b').to eq(Error::StandardError)
  # end

end
