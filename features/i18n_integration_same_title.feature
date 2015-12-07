Feature: Middleman i18n integration with same title
  Scenario: Blog with i18n to en and pt_br languages
    Given the Server is running at "i18n-integration-same-title"
    When I go to "/en/hello-world.html"
    Then I should see "Hello world in en."
    Then I should see:
      """
      <a href="/pt_br/hello-world.html">Quer ler isso em pt-br?</a>
      """
