Then(/^Left Unit picker value should be "([^"]*)"$/) do |value|
  actual_picker_text = find_elements(id:  "select_unit_spinner")[0].text
  puts("Left unit picker value is " + actual_picker_text)

  if actual_picker_text != value
    fail("Expected left unit_picker_value isn't #{value}, actual value is #{actual_picker_text}")
  end
end

Then(/^Right unit picker value should be "([^"]*)"$/) do |value|
  array_of_elements = find_elements(id:  "select_unit_spinner")
  actual_picker_text = array_of_elements[1].text
  if actual_picker_text != value
    fail("Expected right unit_picker_value isn't #{value}, actual value is #{actual_picker_text}")
  end
  puts("Right unit picker value is " + value)
end

Then(/^Show All button should be (enabled|disabled)$/) do |state|
  button_state = find_element(id: "btn_show_all").enabled?
  if state == "enabled"
    fail("Expected to be #{state}") if button_state != true
    puts("button is enabled")
  elsif state == "disabled"
    fail("Expected to be #{state}") if button_state != false
    puts("button is disabled")
  end
end

When(/^I press on Clear button$/) do
  puts("clear button is pressed")
end


When(/^I type "([^"]*)" on application keyboard$/) do |target|
  digits = target.split("")
  digits.each do |num|
    find_element(id: "keypad").find_element(xpath: "//android.widget.Button[@text='#{num}']").click
    puts("Typed #{target} with the keypad")
  end
end

Then(/^I should see result as "([^"]*)"$/) do |result|
  value = find_element(id: "target_value").text
  if value != result
    fail("Expected result isn't #{result}, actual value is #{value}")
  end
  puts("Expected result #{result} is just right :) !")
end

Then(/^I select "([^"]*)" from left unit picker$/) do |value|
  find_elements(id:  "select_unit_spinner")[0].click
  find_in_list(value)
end

Then(/^I select "([^"]*)" from menu$/) do |value|
  text(value).click
end

Then(/^I select "([^"]*)" from right unit picker$/) do |value|
  find_elements(id:  "select_unit_spinner")[1].click
  find_in_list(value)
end

When(/^I press on switch unit button$/) do
  find_element(id: "img_switch").click
end

#History Scenario
Then(/^I should see text "([^"]*)"$/) do |value| 
  text(value)
end

Then(/^I verify that (\d+)(?:st|nd||rd|th)? result in history is "([^"]*)"$/) do |index, text|
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "single_line_element")
  actual_text = array_of_elements[index.to_i - 1] .find_element(id: "history_item_hint").text
  
  if actual_text != text
    fail("Expected text is #{text}, actual text is #{actual_text}")
  end
end

When(/^I press delete from history at (\d+)st row$/) do |index|
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "single_line_element")
  array_of_elements[index.to_i - 1] .find_element(id: "deleteIcon").click
end 