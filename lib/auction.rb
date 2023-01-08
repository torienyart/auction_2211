class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.find_all do |item|
      item.bids == {}
    end
  end

  def potential_revenue
    bidded_items = @items.find_all do |item|
      item.bids != {}
    end

    bidded_items.reduce(0) do |revenue, item|
      revenue + item.current_high_bid
    end
  end
end