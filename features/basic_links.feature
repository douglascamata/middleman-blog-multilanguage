Feature: Basic links for post in other language
  Scenario: An english post has a brazilian portuguese version
    Given the Server is running at "basic-multilanguage-blog"
    When I go to "hello-world.html"
    Then I should see "Hello world in en."
    Then I should see:
      """
      <a href="/ola-mundo.html">Quer ler isso em pt-br?</a>
      """

  Scenario: A brazilian portuguese post has no translations
    Given the Server is running at "basic-multilanguage-blog"
    When I go to "ola-mundo.html"
    Then I should see "Ola mundo em pt-br"
    Then I should not see:
      """
      <a href="/hello-world.html">Want to read this in en?</a>
      """
