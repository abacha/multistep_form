require_relative "../multistep_form.rb"


class Demo
  include MultistepForm

  def steps
    %w[step1 step2 step3]
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
    demo.force_step(index: 2)
    demo.last_step?.should be_true
    demo.force_step(steps[0])
    demo.first_step?.should be_true
    demo.last_step?.should be_false
  end
end
