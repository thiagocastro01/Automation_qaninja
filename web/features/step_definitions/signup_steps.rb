Given('I am on the sign-up screen') do
    @signup_page.open
end
  
When('I submit the sign up form with:') do |table|
    @user = table.rows_hash
    MongoDB.new.remove_user(@user[:email])
    @signup_page.create(@user)
end

When('I submit the sign up form wrong as:') do |table|
    @user = table.hashes.first
    @signup_page.create(@user)
end
