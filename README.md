multistep_form
==============


controller
````
class AccountsController < ApplicationController
  include MultistepForm
  
  def update
    @account = Account.find(params[:id])
    if params[:back_button]
      previous_step
    else
      next_step { @account.update_attributes(params[:account]) }
    end
  end
  
  private
  def steps
    [:personal, :professional, :others]
  end
end
````

view
````
- if @current_step == :personal
  render :form_personal
- elsif @current_step == :professional
  render :form_professional
- else
  render :form_others
````


## Authorship

Written by [Adriano Bacha](http://github.com/abacha)

## License

Copyright (c) 2013 Adriano Bacha

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---
