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
    bidded_items.reduce(0) do |revenue, item|
      revenue + item.current_high_bid
    end
  end

  def bidded_items
    @items.find_all do |item|
      item.bids != {}
    end
  end

  def bidders
    bidded_items.flat_map do |item|
      item.bids.keys
    end
  end

  def bidder_info
    hash = {}
    bidders.each do |bidder|
      hash[bidder] = {
        :budget => bidder.budget,
        :items => []
      }
    end

    bidded_items.each do |bidded_item|
      bidded_item.bids.keys.each do |attendee|
        hash[attendee][:items] << bidded_item
      end
    end

    hash
  end
end