Given 'this global step is pending' do
  pending
end

class Cucumber::Features::Pending < Cucumber::FeatureSteps
  step 'this local step is pending' do
    pending
  end
end
