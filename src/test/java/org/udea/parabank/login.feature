@appcontact_login
Feature: Login to app contact

  Background:
    * url baseUrl
    * header Accept = acceptHeader

  Scenario: Customer Login
    Given path loginEndpoint
    And request {"email": "#(userEmail)", "password": "#(userPassword)"}
    When method POST
    Then status 200
    And match response ==
    """
    {
    "user": {
        "_id": '#string',
        "firstName": '#string',
        "lastName": '#string',
        "email": '#string',
        "__v": '#number',
    },
    "token": '#string',
    }
    """