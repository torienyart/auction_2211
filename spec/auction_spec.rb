require './lib/item'
require './lib/attendee'
require './lib/auction'

describe Auction do
  let(auction){Auction.new}

  it 'exists' do
    expect(auction).to be_an_instance_of Auction
  end

  it 'has readable attributes' do
    expect(auction.items).to eq([])
  end

  before (:each) do
    auction.add_item(item1)
    auction.add_item(item2)
  end
  it 'can add_items' do
    expect(auction.items).to eq(item1, item2)
  end

  it 'can tell item names' do
    expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end
end