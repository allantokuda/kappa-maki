Given 'I have a global string step' do
  @test = 456
end

Given /I have (a|another) global regex step/ do |capture|
  expect(capture).to match /a|another/
end

Then 'global instance variables stay in the World scope' do
  expect(@test).to eq 456
end

class Cucumber::Features::InstanceVariables < Cucumber::FeatureSteps
  step 'I have a local step' do
    @test = 123
  end

  step 'local instance variables stay in the object scope' do
    expect(@test).to eq 123
  end
end
