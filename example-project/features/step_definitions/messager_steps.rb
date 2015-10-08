Given(/^I have initiated a messaging session with a friend$/) do
  #create_user('allan', 'password')
  #create_user('zeff', 'password')
  #login_as('allan', 'password')
  #initiate_messaging_session('allan', 'zeff')
end

When(/^I enter a message$/) do
  #within_session('allan') { type_message('hello zeff') }
end

When(/^press Send$/) do
  #within_session('allan') { send_message }
end

Then(/^my friend receives the message$/) do
  #within_session('zeff') do
  #  expect_message('hello zeff')
  #end
end

Given(/^I have initiated a messaging session$/) do
end

Given(/^I am viewing the Add Friend dialog$/) do
end

When(/^I enter the username of my friend$/) do
end

When(/^I press Add$/) do
  puts "Friend successfully added!"
end

Then(/^my friend receives an invitation to exchange messages$/) do
end
