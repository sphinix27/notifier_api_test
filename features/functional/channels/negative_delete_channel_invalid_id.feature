@functional @bug @all
Feature: Negative responses after making a delete request by invalid id

  Scenario Outline: Can't delete a channel by id with invalid params
    Given I make a 'DELETE' request to '/channels/<Id>' endpoint
    When I execute the request to the endpoint
    Then I expect a '<status_code>' status code
    And excluding 'timestamp' and 'message' the response body contains:
    """
      {
    "status": <status_code>,
    "error": "<error>",
    "exception": "org.springframework.web.method.annotation.MethodArgumentTypeMismatchException",
    "path": "/channels/<Id>"
}
    """
    Examples:
      | Id     | status_code  | error                  |
      | abc    |      400     |    Bad Request         |
      | !@$    |      400     |    Bad Request         |
      | SDDF   |      400     |    Bad Request         |
      | 070./  |      400     |    Bad Request         |
      | 4*]@!# |      400     |    Bad Request         |
      | AMct   |      400     |    Bad Request         |
      | 510@   |      400     |    Bad Request         |
      | 510.   |      404     |    Not found           |
      | 510.1  |      404     |    Not found           |
      | 510.a  |      404     |    Not found           |
      | 51#$   |      404     |    Not found           |
      | 610.M  |      404     |    Not found           |
      | .      |      400     |    Bad Request         |
      | 1170   |      404     |    Not found           |
      |        |      405     |    Method Not Allowed  |



