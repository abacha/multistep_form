require_relative "../multistep_form.rb"

describe MultistepForm do

  it "expects a 'steps' method" do
    expect { 
      class DemoWithError
        include MultistepForm
      end.new
    }.to raise_error(MultistepForm::StepsNotDefined)

    expect { 
      class Demo
        include MultistepForm
        def steps
          {}
        end
      end.new
    }.not_to raise_error(MultistepForm::StepsNotDefined)
  end
end
