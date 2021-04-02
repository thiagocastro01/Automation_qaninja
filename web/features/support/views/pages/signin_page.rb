
class Signin_page

    include Capybara::DSL

    def open
        visit '/'
    end

    def login_with(user)
        find('#user_email').set user[:email]
        find('#user_password').set user[:password]
        
        click_button 'Entrar'
    end
end
