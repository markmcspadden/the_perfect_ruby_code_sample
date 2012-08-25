class BaseTest
  def self.tests
    @tests ||= []
  end

  def self.output

  end
end

@test_class = nil

def hey!(class_name=Object)
  fork do
    `afplay "#{File.dirname(__FILE__)}/song.m4a"`
  end

  puts "Testing #{class_name}"
  puts "Hey!"

  test_class_name = "#{class_name}Test"

  @test_class = Object.const_set(test_class_name, Class.new(BaseTest))

  yield

  puts "Summary: #{@test_class.tests.size} Tests | #{@test_class.tests.reject{ |t| t.last }.size} errors"

  Object.send(:remove_const, test_class_name.to_sym)
end

def i_just(context)
  puts "  I just #{context}"

  yield
end

def this_is(objective)
  puts "  -- This is: #{objective}"

  yield

  passed = false

  passed = yield

  if passed
    puts "     Passed"
  else
    puts "     FAILED"
  end

  @test_class.tests << [objective, passed]
end

def heres_my_number
  puts "Here's My Number"
  yield
end

def assert_me_maybe?
  puts "Assert Me Maybe?"
  yield
end

def call_me_maybe?
  puts "Call Me Maybe?"
end

def since(event_string)
  puts "Since #{event_string}"
  yield
end

def i_miss_you_so_bad
  #puts "PENDING"
  puts "I miss you so bad"
end

def i_miss_you_so_so_bad
  #puts "PENDING AND WILL FAIL"
  puts "I miss you so so bad"
end