module MultistepForm
  StepsNotDefined = Class.new(StandardError)

  def initialize
    raise StepsNotDefined unless defined?(steps)
  end
end
