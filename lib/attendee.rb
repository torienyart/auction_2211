class Attendee
  attr_reader :name, :budget
  def initialize(info)
    @name = info[:name]
    @budget = convert(info[:budget])
  end

  def convert(info)
    info.scan(/\d/).join.to_i
  end
end