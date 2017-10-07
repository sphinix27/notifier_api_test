Feature: created template

  Scenario Outline: create a new template with invalid name params
    Given I make a 'POST' request to '/templates' endpoint
    When I set the body as:
    """
   {
        "name": "<name>",
        "subjectTemplate": template1,
        "contentTemplate": "This is a new complete template.",
        "description": template
     }
    """
    

    Examples:
      |name|
      |    |
      | longggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg |
      | sho |
      |   #"$"#$#%gfht7 …-56 |
      |   . |