Given(/^I land on Home screen$/) do
  find_element(id: "action_search")
  #find_element(id: "action_add_favorites")
  puts("I landed on Home screen")
end

When(/^I press on Menu icon$/) do
  find_element(accessibility_id: "Abrir el cajon de navegacion").click
  puts("Menu icon pressed")
end

Then(/^I should see left side menu$/) do
  text("Conversor de Unidades")
  puts("I see left side menu")
end

When(/^I press on My conversions button$/) do
  text("Mis conversiones").click
  puts("My conversions button pressed")
end

Then(/^I land on My conversions screen$/) do
  text("Sin conversión personal creado todavía")
  puts("Landed on My conversions screen")
end

#Search Exisiting Conversions
Then("I press on search icon") do
  find_element(id: "action_search").click
end

Then(/^I type "([^"]*)" in search field$/) do |text|
  find_element(id: "search_src_text").send_keys(text)
end

Then("I press return button on soft keyboard") do
  Appium::TouchAction.new.tap(x:0.99,y:0.99, count: 1).perform
end

Then(/^I see "([^"]*)" as current unit converter$/) do |current_unit|
  find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='#{current_unit}']")
end

