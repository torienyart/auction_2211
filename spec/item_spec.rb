require './lib/item'


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
end