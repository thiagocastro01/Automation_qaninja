Given('I am on sign in page') do
    @signin_page.open
end

When('I log into Rocklov with my valid credentials') do
    @signin_page.login_with(@user)
end

When('I try sign in Rocklov with:') do |table|
    @invalid_user = table.hashes.first
    @signin_page.login_with(@invalid_user)

end