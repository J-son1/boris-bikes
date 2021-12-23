class Bike
  def initialize
    @working = true
  end

  def working?
    @working
  end

  def report_broken
    @working = false
    @broken = true
  end

  def broken?
    @broken
  end
end