@editor @editor_atto @atto @atto_fullscreen @_bug_phantomjs
Feature: Atto fullscreen editor button
  In order to edit big text
  I need to use an editing tool to expand editor.

  Background:
    Given I log in as "admin"
    And I navigate to "Plugins > Text editors > Atto HTML edito > Atto toolbar settings" in site administration
    And I set the field "Toolbar config" to "other = html, fullscreen, bold, charmap"
    And I press "Save changes"
    And I open my profile in edit mode
    And I set the field "Description" to "Elephant"

@javascript @atto_fullscreen_highlight
  Scenario: Click fullscreen button and check highlighting
    When I click on "Toggle full screen" "button"
    Then "button.atto_fullscreen_button.highlight" "css_element" should exist

@javascript @atto_fullscreen_block
  Scenario: Click fullscreen button and block elements
    When I click on "Toggle full screen" "button"
    Then I should not see "country"

@javascript @atto_fullscree_blur
  Scenario: Click fullscreen button and leave focus
    When I click on "Toggle full screen" "button"
    And I press tab key in ".editor_atto_content" "css_element"
    Then "button.atto_fullscreen_button:not(.highlight)" "css_element" should exist

@javascript @atto_fullscreen_htmlcompat
  Scenario: Use fullscreen with html button
    When I click on "HTML" "button"
    And I click on "Toggle full screen" "button"
    Then "button.atto_fullscreen_button.highlight" "css_element" should exist

@javascript @atto_fullscreen_dialogue
  Scenario: Use fullscreen with charmap dialogue
    When I click on "Toggle full screen" "button"
    And I click on "Insert character" "button"
    And I click on "cent sign" "button"
    Then "button.atto_fullscreen_button.highlight" "css_element" should exist
