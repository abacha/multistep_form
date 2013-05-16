module MultistepForm
  StepsNotDefined = Class.new(StandardError)

  def initialize(*args)
    raise StepsNotDefined unless defined?(steps)
    super(*args)
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

  def next_step(&block)
    step(1, &block)
  end

  def previous_step(&block)
    step(-1, &block)
  end

  def step(index, &block)
    return if block_given? && block.call == false
    @current_step = steps[steps.index(current_step) + index]
  end
end
