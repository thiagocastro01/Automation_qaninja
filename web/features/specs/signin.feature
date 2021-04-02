Feature: Sign in to Rocklov

    I, as a registered user who owns musical instruments,
    Want to sign in at Rocklov
    To make them available for rent


    Background:
        Given that I am a registered user as
            | name        | email                | password |
            | tester john | testerjonh@gmail.com | test123  |
        And I am on sign in page


    Scenario: Sign in - happy road
        When I log into Rocklov with my valid credentials
        Then I should see the dashboard

    @temporary
    Scenario Outline: Try Signin
        When I try sign in Rocklov with:
            | email         | password         |
            | <email_input> | <password_input> |
        Then I should see the alert message: '<message_output>'

        Examples:
            | email_input          | password_input | message_output                   |
            |                      | test123        | Oops. Informe um email válido!   |
            | testerjonh$gmail.com | test123        | Oops. Informe um email válido!   |
            | testerjonh@gmail.com |                | Oops. Informe sua senha secreta! |
            | testerjonh@gmail.com | wrong          | Usuário e/ou senha inválidos.    |