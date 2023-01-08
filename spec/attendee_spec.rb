require './lib/attendee'

describe Attendee do
  let(:attendee){Attendee.new(name: 'Megan', budget: '$50')}
 
  it 'exists' do
    expect(attendee).to be an Attendee
  end

  it 'has readable attributes' do
    expect(attendee.name).to eq("Megan")
    expect(attendee.budget).to eq(50)
  end
end