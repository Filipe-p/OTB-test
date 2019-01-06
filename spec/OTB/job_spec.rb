RSpec.describe 'Job Class - Intializer' do

  it "New Job has a @job" do
    expect(OTB::Job.new('')).not_to be_nil
  end
end

RSpec.describe 'Job Class - Parser' do

  it "When passed '' to not be nil " do
    expect(OTB::Job.parse('')).not_to be_nil
  end

  it "When passed '' to be a hash" do
    expect(OTB::Job.parse('')).to be_a_kind_of(Hash)
  end

  it "When passed empty string ('')  to respond ''=>['']}" do
    expect(OTB::Job.parse('')).to eq({''=>''})
  end

  it "When passed 'a =>' to respond with a hash" do
    expect(OTB::Job.parse('a =>')).to be_a_kind_of(Hash)
  end

  it "When passed 'a =>' to respond with a'=>''}" do
    expect(OTB::Job.parse('a =>')).to eq({'a'=>''})
  end


  it 'When passed ' + 'a => \nb => \nc => ' + " to respond {'a'=>'', 'b'=>'','c'=>''}" do
    expect(OTB::Job.parse('a => \nb => \nc =>')).to eq({'a'=>'', 'b'=>'','c'=>''})
  end

  it 'When passed ' + 'a => \nb => c \nc => f \nd => a \ne => b \nf' + " to respond with {'a'=>'', 'b'=>'c','c'=>'f','d'=>'a','e'=>'b','f'=>''}" do
    expect(OTB::Job.parse('a => \nb => c \nc => f \nd => a \ne => b \nf')).to eq({'a'=>'', 'b'=>'c','c'=>'f','d'=>'a','e'=>'b','f'=>''})
  end
end
