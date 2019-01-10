class Failure
  attr_reader :desc

  def self.with_desc(desc)
    Failure.new(desc: desc)
  end

  def initialize(desc:)
    @desc = desc
  end

  def successful?
    false
  end
end
