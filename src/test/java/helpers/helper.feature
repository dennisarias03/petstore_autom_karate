Feature: my helper features

  Background:
    * url baseUrl

  @name=createPetInformations
  Scenario: Create Pet Informations
    * def fakerObj =  new faker()
    * def petId = 4
    * def petCategoryId = 0
    * def petCategoryName = fakerObj.name().name()
    * def petName = 'doggie'
    * def petPhotoUrls = 'https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg'
    * def PetTagsId = fakerObj.number().digit()
    * def PetTagsName = 'Juguetón'
    * def PetStatus = 'available'
