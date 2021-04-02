Given("that I am logged on Rocklov") do
  @email = @user[:email]
  @signin_page.open
  @signin_page.login_with(@user)
end

Given("that i acess the ad registration form") do
  @dash_page.goto_ad_form
end

Given("that i have the follow equipment:") do |table|
  @ad = table.rows_hash
  MongoDB.new.remove_ad(@ad[:name], @email)
end

When("I submit the registration of this item") do
  @equipments_page.create(@ad)
end

Then("i should see this item on my dashboard") do
  expect(@dash_page.ad_list).to have_content @ad[:name]
  expect(@dash_page.ad_list).to have_content "R$#{@ad[:value]}/dia"
end
