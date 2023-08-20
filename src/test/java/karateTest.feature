Feature: Plan de pruebas

  Background:
    Given url baseUrl

  Scenario: create pet
    And path "pet"
    And header Content-Type = 'application/json'
    And def getPetInformations = call read('classpath:helpers/helper.feature@name=createPetInformations')
    * def requestBody =
      """ {
            "id": #(getPetInformations.petId),
            "category": {
                          "id": #(getPetInformations.petCategoryId),
                          "name": "#(getPetInformations.petCategoryName)",
                         },
            "name": "#(getPetInformations.petName)",
            "photoUrls": [
                          "#(getPetInformations.petPhotoUrls)",
                         ],
            "tags": [
                      {
                        "id": #(getPetInformations.PetTagsId),
                        "name": "#(getPetInformations.PetTagsName)",
                      }
                    ],
            "status": "#(getPetInformations.PetStatus)",
  }
    """
    And request requestBody
    When method POST
    Then status 200
    And match response.id == getPetInformations.petId


  Scenario: Search pet by petId
    * def getPetInformations = call read('classpath:helpers/helper.feature')
    * path "pet/" + getPetInformations.petId
    When method GET
    Then status 200
    And match response.id == getPetInformations.petId
    Then print response

  Scenario: Update name status pet
    * def getPetInformations = call read('classpath:helpers/helper.feature')
    * path "pet/" + getPetInformations.petId
    And header accept = 'application/json'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field name = 'sold'
    And form field status = 'sold'
    When method post
    Then status 200
    Then print response

  Scenario: search Pet by status
    * def getPetInformations = call read('classpath:helpers/helper.feature')
    * path "pet/findByStatus"
    And param status = 'sold'
    When method get
    Then status 200
    Then print response