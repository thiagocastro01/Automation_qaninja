Feature: Sign up at Rocklov
    I, as a person who owns musical instruments,
    Want to register at Rocklov
    To make them available for rent

    Background:
        Given I am on the sign-up screen


    Scenario: Sign up - happy road
        When I submit the sign up form with:
            | name     | user test           |
            | email    | emailtest@gmail.com |
            | password | test123             |
        Then I should see the dashboard

  
    Scenario Outline: Try sign up
        When I submit the sign up form wrong as:
            | name         | email         | password         | expect message   |
            | <name_input> | <email_input> | <password_input> | <message_output> |
        Then I should see the alert message: '<message_output>'

        Examples:
            | name_input  | email_input          | password_input | message_output                   |
            |             | testerjonh@gmail.com | test123        | Oops. Informe seu nome completo! |
            | tester john |                      | test123        | Oops. Informe um email válido!   |
            | tester john | testerjonh%gmail.com | test123        | Oops. Informe um email válido!   |
            | tester john | test@gmail.com       |                | Oops. Informe sua senha secreta! |



