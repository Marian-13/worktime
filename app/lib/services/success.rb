class Success
  class AccessToUnsetValueError < StandardError; end
  class UnsetValue; end

  def self.with_value(value)
    self.new(value: value)
  end

  def self.without_value
    self.new
  end

  def initialize(value: UnsetValue.new)
    @value = value
  end

  def successful?
    true
  end

  def has_value?
    !@value.instance_of?(UnsetValue)
  end

  def value
    raise AccessToUnsetValueError unless has_value?

    @value
  end
end
