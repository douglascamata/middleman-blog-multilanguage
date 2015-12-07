Feature: Middleman i18n integration
  Scenario: Blog with i18n to en and pt_br languages
    Given the Server is running at "i18n-integration"
    When I go to "hello-world.html"
    Then I should see "Hello world in en."
    Then I should see:
      """
      <a href="/ola-mundo.html">Quer ler isso em pt-br?</a>
      """
