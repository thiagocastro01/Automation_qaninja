Given('that I am a registered user as') do |table|
    @user = table.hashes.first
    MongoDB.new.remove_user(@user[:email])
    @signup_page.open
    @signup_page.create(@user)
end

Then('I should see the dashboard') do
    expect(page).to have_css ".dashboard"
end

Then('I should see the alert message: {string}') do |expect_message|
    expect(@alert.dark).to have_text(expect_message)
end