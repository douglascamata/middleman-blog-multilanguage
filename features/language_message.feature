Feature: Change the text of the link to another language version
  Scenario: English post with portuguese version and portuguese template changed
    Given the Server is running at "language-message-template"
    When I go to "hello-world.html"
    Then I should see "Hello world in en."
    Then I should see:
      """
      <a href="/ola-mundo.html">Deseja ler em portugues do brasil?</a>
      """
