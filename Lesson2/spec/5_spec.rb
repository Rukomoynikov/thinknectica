require "rspec"
require_relative "../5.rb"

describe "heyehey" do
	it "should be lalala" do 
		expect(is_year_leap(2004)).to be(true)
	end
end