Given /something standard is set up in mode (\d+)/ do |mode_num|
  puts ' '*120 + "GLOBAL SETUP STEP has run with mode number #{mode_num}"
end

class Cucumber::Features::MarvellousMessager < Cucumber::FeatureSteps
  #require 'pry'
  step 'I have initiated a messaging session with a friend' do
    #create_user('allan', 'password')
    #create_user('zeff', 'password')
    #login_as('allan', 'password')
    #initiate_messaging_session('allan', 'zeff')
  end

  step 'I enter a message' do
    #within_session('allan') { type_message('hello zeff') }
  end

  step 'press Send' do
    #within_session('allan') { send_message }
  end

  step 'my friend receives the message' do
    #within_session('zeff') do
    #  expect_message('hello zeff')
    #end
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
