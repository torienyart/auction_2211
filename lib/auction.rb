require 'date'
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

  def generate_todays_date
    Date.today
  end

  def date
    d = generate_todays_date

    month_st = d.month.to_s
    day_st = d.day.to_s

    if month_st.length <2
      month = month_st.rjust(2, '0').to_s
    end

    if day_st.length <2
      day = day_st.rjust(2, '0').to_s
    end

    date_s = [month, day, d.year].join('/')
  end
end