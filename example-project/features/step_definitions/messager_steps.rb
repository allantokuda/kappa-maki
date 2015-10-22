Given /something standard is set up in mode (\d+)/ do |mode_num|
  puts ' '*120 + "GLOBAL SETUP STEP has run with mode number #{mode_num}"
end

class Cucumber::Features::MarvellousMessager < Cucumber::FeatureSteps
  step 'I have initiated a messaging session with a friend' do
    @session = 'session 1'
  end

  step 'I enter a message' do
  end

  step 'press Send' do
    expect(@session).to eq 'session 2'
  end

  step 'my friend receives the message' do
  end

  step 'I have initiated a messaging session' do
  end

  step 'I am viewing the Add Friend dialog' do
  end

  step 'I enter the username of my friend' do
  end

  step 'I press Add' do
    puts ' '*120 + "STEP: Friend successfully added!"
  end

  step 'my friend receives an invitation to exchange messages' do
  end
end
