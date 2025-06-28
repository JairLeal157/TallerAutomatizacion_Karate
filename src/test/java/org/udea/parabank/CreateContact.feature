@appcontact_createcontact
Feature: create contact to app contact

  Background:
    * url baseUrl
    * header Accept = acceptHeader

Scenario: Login y crear contacto
  # Login
  Given path loginEndpoint
  And request { "email": "#(userEmail)", "password": "#(userPassword)" }
  When method POST
  Then status 200
  * def authToken = response.token

  # Crear contacto
  Given path contactsEndpoint
  And header Authorization = 'Bearer ' + authToken
  And request contactData
  When method POST
  Then status 201
