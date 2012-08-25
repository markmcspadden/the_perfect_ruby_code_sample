require 'test_me_maybe?'

class Person
  attr_accessor :first_name, :last_name, :twitter_username

  def valid?
    first_name.to_s.chomp != "" && last_name.to_s.chomp != ""
  end
end

hey! Person do

  i_just "want to validate basic attributes" do
    this_is "first_name" do
      heres_my_number do
        @person = Person.new
        @person.first_name = ""
        @person.last_name = "McSpadden"
      end

      assert_me_maybe? do
        !@person.valid?
      end
    end

    this_is "last_name" do
      heres_my_number do
        @person = Person.new
        @person.first_name = "Mark"
        @person.last_name = ""
      end

      assert_me_maybe? do
        !@person.valid?
      end
    end

    this_is "all valid" do
      heres_my_number do
        @person = Person.new
        @person.first_name = "Mark"
        @person.last_name = "McSpadden"
      end

      assert_me_maybe? do
        @person.valid?
      end
    end
  end
end

# i_miss_you_so_bad # Pending

# i_miss_you_so_so_bad # Pending but shouldn't be