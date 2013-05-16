module MultistepForm
  StepsNotDefined = Class.new(StandardError)

  def initialize
    raise StepsNotDefined unless defined?(steps)
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def force_step(options)
    if options.is_a?(Hash)
      @current_step = steps[options[:index]]
    else
      @current_step = options
    end
  end

  def current_step
    @current_step || steps.first
  end
end
