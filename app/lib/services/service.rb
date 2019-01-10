class Service
  def self.call(params)
    self.new(params).call
  end

  def self.params(*params)
    attr_reader *params

    define_method :initialize do |attributes|
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end

  # def self.action(&block)
  #   self.instance_variable_set('@action', block)
  # end
  #
  # def call
  #   instance_exec(&self.class.instance_variable_get('@action'))
  # end
end
