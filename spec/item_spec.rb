require './lib/item'
require './lib/attendee'


describe Item do
  let(:item1){Item.new('Chalkware Piggy Bank')}
  let(:item2){item2 = Item.new('Bamboo Picture Frame')}
  
  it 'exists' do
    expect(item1).to be_an_instance_of Item
    expect(item2).to be_an_instance_of Item
  end

  it 'has readable attributes' do
    expect(item1.name).to eq("Chalkware Piggy Bank")
  end
  
  describe 'bids' do
    it 'can track bids' do
      expect(item1.bids).to eq({})
    end

    it 'can add bids' do
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)

      expect(item1.bids).to eq({
        attendee2 => 20,
        attendee1 => 22
      })
    end

  it 'can track highest bid' do
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    expect(item1.current_high_bid).to eq(22)
  end
end