require 'spec_helper'

describe CountryList do

  it "can return an array of countries" do
    country_list = CountryList.new

    expect(country_list.all).to be_kind_of(Array)
    expect(country_list.all.length).to be > 0
  end

  it "can return an array of continents" do
    country_list = CountryList.new

    expect(country_list.continents).to eq(["Africa", "Europe", "North America", "South America"])
  end

  describe "#countries_for_continent" do
    it "returns an array of countries associated with the related continent" do
      country_list = CountryList.new
      countries = country_list.countries_for_continent("Africa")
      expect(countries.length).to eq(2)
      countries = country_list.countries_for_continent("North America")
      expect(countries.length).to eq(3)
    end
  end

end