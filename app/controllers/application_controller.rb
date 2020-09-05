class ApplicationController < ActionController::Base
   
   def hello
      render text: "hello, vijeeth!"
   end
end
