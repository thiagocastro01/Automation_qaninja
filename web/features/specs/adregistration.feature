Feature: Adversment registration
    I, as a person who owns musical instruments,
    I want to advertise my equipment
    To make them available for rent

    Background:
        Given that I am a registered user as
            | name        | email                | password |
            | tester john | testerjonh@gmail.com | test123  |
        And that I am logged on Rocklov

    @newad
    Scenario: New ad
        Given that i acess the ad registration form
        And that i have the follow equipment:
            | thumb    | fender-sb.jpg |
            | name     | Fender Strato |
            | category | Cordas        |
            | value    | 200           |
        When I submit the registration of this item
        Then i should see this item on my dashboard

    Scenario Outline: Try register new ad
        Given that i acess the ad registration form
        And that i have the follow equipment:
            | thumb    | <thumb>    |
            | name     | <name>     |
            | category | <category> |
            | value    | <value>    |
        When I submit the registration of this item
        Then I should see the alert message: '<message_output>'

        Examples:
            | thumb         | name          | category | value | message_output                       |
            |               | Fender Strato | Cordas   | 200   | Adicione uma foto no seu anúncio!    |
            | fender-sb.jpg |               | Cordas   | 200   | Informe a descrição do anúncio!      |
            | fender-sb.jpg | Fender Strato |          | 200   | Informe a categoria                  |
            | fender-sb.jpg | Fender Strato | Cordas   |       | Informe o valor da diária            |
            | fender-sb.jpg | Fender Strato | Cordas   | 200a  | O valor da diária deve ser numérico! |