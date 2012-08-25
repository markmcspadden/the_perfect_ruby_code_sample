require 'test_me_maybe?'

hey! "Test Me Maybe" do

  i_just "want to test_me_maybe?" do
    test_me_maybe? do
      test = lambda { 
        hey! "Meta" do
          test_me_maybe? do
            true
          end
        end  }

      test.call.output == "TRUE"
    end
  end
end