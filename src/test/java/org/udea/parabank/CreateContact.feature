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
  And match response contains { "_id": "#string", "firstName": "#string", "lastName": "#string", "birthdate": "#string", "email": "#string", "phone": "#string", "street1": "#string", "street2": "#string", "city": "#string", "stateProvince": "#string", "postalCode": "#string", "country": "#string", "owner": "#string", "__v": "#number" }

  