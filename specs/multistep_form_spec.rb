require "multistep_form"

class Demo
  include MultistepForm
  attr_accessor :session

  def steps
    %w[step1 step2 step3]
  end

  def session
    @session ||= {}
  end
end

describe MultistepForm do
  let(:demo) { Demo.new }
  let(:steps) { %w[step1 step2 step3] }

  it "expects a 'steps' method" do
    expect { 
      class DemoWithError
        include MultistepForm
      end.new
    }.to raise_error(MultistepForm::StepsNotDefined)

    expect { 
      Demo.new
    }.not_to raise_error(MultistepForm::StepsNotDefined)
  end

  it "test steps" do
    demo.first_step?.should be_true
    demo.last_step?.should be_false
    demo.force_step(2, true)
    demo.last_step?.should be_true
    demo.force_step(steps[0])
    demo.first_step?.should be_true
    demo.last_step?.should be_false
  end

  it "steps up" do
    demo.next_step
    demo.current_step.should == steps[1]
  end

  it "steps down" do
    demo.force_step(1, true)
    demo.previous_step
    demo.current_step.should == steps[0]
  end

  it "advance a step if a block is valid" do
    demo.next_step { demo.first_step? }
    demo.current_step.should == steps[1]
    demo.next_step { 1 == 2 }
    demo.current_step.should == steps[1]
    demo.next_step { !demo.last_step? }
    demo.current_step.should == steps[2]
  end

  it "advance a step if a block is valid" do
    demo.force_step(2, true)
    demo.previous_step { demo.last_step? }
    demo.current_step.should == steps[1]
    demo.previous_step { demo.last_step? }
    demo.current_step.should == steps[1]
    demo.previous_step { 1 == 1 }
    demo.current_step.should == steps[0]
  end

  it "should record on session" do
    demo.force_step(1, true)
    demo.session["demo_current_step"].should == steps[1]
    demo.force_step(2, true)
    demo.session["demo_current_step"].should == steps[2]
  end
end
