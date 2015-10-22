class Cucumber::Features::CoolCalculator < Cucumber::FeatureSteps
  step 'I have entered two numbers into the calculator' do
    enter_two_numbers
    puts ' '*120 + 'STEP: I entered two numbers'
  end

  step 'I press Add' do
    puts ' '*120 + 'STEP: I pressed Add'
  end

  step 'the result should be the sum of the two numbers' do
    puts ' '*120 + 'STEP: result was sum of two numbers'
  end

  def enter_two_numbers
    puts ' '*120 + "LOCAL METHOD CALLED! Entering two numbers 12 and 42"
  end
end
