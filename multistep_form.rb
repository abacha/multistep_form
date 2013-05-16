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

  def force_step(step, as_index = false)
    if as_index
      @current_step = steps[step]
    else
      @current_step = step
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
    force_step(steps.index(current_step) + index, true)
  end
end
