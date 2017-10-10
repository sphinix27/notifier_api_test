@smoke @all
Feature: Specific Template

  Background: Create a Template
    Given I make a 'POST' request to '/templates' endpoint
    When I set the body as:
    """
    {
     "name" : "New Template",
     "subjectTemplate":"${information}",
     "contentTemplate":"Jalasoft account \nVerify your email address \n \nTo finish setting up this Microsoft account, we just need to make sure this email address is yours. \n${email} \nOr you may be asked to enter this security code: ${code} \nThanks, \nThe Jalasoft account team."
     }
    """
    And I execute the request to the endpoint
    Then I expect a '201' status code
    And I save the 'id' of 'templates'

  Scenario:  Get a specific Template
    Given I make a 'GET' request to '/templates/$id' endpoint
    When I execute the request to the endpoint
    Then I expect a '200' status code