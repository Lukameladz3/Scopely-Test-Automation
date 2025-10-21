Feature: Star Trek Fleet Command Web Portal - Initial Landing Page
  As a first-time visitor to Star Trek Fleet Command web portal
  I want to understand what the game offers before creating an account
  So that I can make an informed decision about playing the game

  Background:
    Given I navigate to https://home.startrekfleetcommand.com/
    And I have not logged in
    And I have not accepted cookies yet

  @landing_page @first_visit
  Scenario: First-time visitor sees loading screen
    When the page is loading
    Then I should see a loading animation with spinning icon
    And I should see text "All power to the engines!"
    And I should see text "Set a course for the Final Frontier!"
    And the loading screen should have a space-themed background

  @landing_page @cookie_consent
  Scenario: Cookie consent appears on first visit
    When the page finishes loading
    Then I should see a cookie consent banner at the bottom
    And the banner should have "Privacy" as the dialog title
    And I should see cookie explanation text containing "We and our partners use cookies"
    And I should see three action buttons:
      | Button          | Description                                |
      | Accept Cookies  | Accepts all cookies                      |
      | Decline All     | Declines optional cookies                |
      | Manage Settings | Opens preference center for cookie control |

  @landing_page @cookie_management
  Scenario: User can manage cookie preferences
    Given the cookie consent banner is displayed
    When I click "Manage Settings" button
    Then I should see detailed cookie preferences
    And I should be able to select which types of cookies to accept:
      | Cookie Type      | Purpose                                    |
      | Required         | Essential for site functionality          |
      | Analytics        | Traffic analysis and site improvement     |
      | Advertising      | Personalized advertising and measurement  |
    And I should see options to save my preferences

  @landing_page @hero_section
  Scenario: Landing page displays main hero banner
    Given I have handled the cookie consent
    When I view the main content area
    Then I should see a prominent news banner with:
      | Element                     |
      | News category label         |
      | Latest update title         |
      | Update description preview  |
      | "Read more" call-to-action  |
      | Background image            |
    And the latest update should be about current game patches or events

  @landing_page @promotional_cards
  Scenario: Landing page shows promotional offer cards
    Given I am on the landing page
    When I scroll to the promotional section
    Then I should see multiple promotional cards:
      | Card Title                        | Call to Action | Special Badge        |
      | Explore the Web Store            | GO TO STORE    | FEATURED            |
      | Get Multiphasic Credits          | GO TO STORE    | PC & WEB EXCLUSIVE  |
    And each card should have an attractive offer image
    And each card should have a blend/gradient effect

  @landing_page @news_grid
  Scenario: Landing page displays news article grid
    Given I am on the landing page
    When I scroll to "Latest News & Updates" section
    Then I should see a grid of at least 8 news articles
    And each article card should display:
      | Element              |
      | Article thumbnail    |
      | Publication date     |
      | Article title        |
      | Article preview text |
      | #News hashtag        |
      | "Read more" link     |
    And I should see a "See All Articles" link pointing to the full news section

  @landing_page @navigation_visibility
  Scenario: Main navigation is visible without login
    When I view the page header
    Then I should see the Star Trek Fleet Command logo
    And I should see "Sign in with Scopely" button prominently displayed
    And I should see the main navigation menu with items:
      | Menu Item    | Accessibility           |
      | Home         | Fully accessible        |
      | Store        | Requires authentication |
      | Events       | Requires authentication |
      | Redeem Code  | Requires authentication |
      | News         | Fully accessible        |

  @landing_page @platform_downloads
  Scenario: Landing page promotes game availability on multiple platforms
    When I view the sidebar section
    Then I should see "PLAY ON YOUR COMPUTER" heading
    And I should see "Windows and Mac Supported" subtext
    And I should see download badges for:
      | Platform    | Store                |
      | iOS         | App Store           |
      | Android     | Google Play Store   |
    And clicking each badge should open the respective app store

  @landing_page @social_media_presence
  Scenario: Landing page displays social media links
    When I scroll to the footer section
    Then I should see social media icons in this order:
      | Platform  | Expected URL Pattern                    |
      | Facebook  | facebook.com/StarTrekFleetCommand      |
      | YouTube   | youtube.com/channel/                   |
      | Twitter   | twitter.com/StarTrekFleet             |
      | Instagram | instagram.com/startrekfleetcommand    |
      | Discord   | discord.gg/stfc                        |
    And each icon should be visually distinct and clickable

  @landing_page @legal_compliance
  Scenario: Landing page displays required legal information
    When I view the footer section
    Then I should see copyright notice "© 2025 CBS Broadcasting Inc. and Paramount Pictures Corporation"
    And I should see "All Rights Reserved" text
    And I should see "Game Software © 2025 Scopely, Inc."
    And I should see clickable legal links:
      | Link             | Expected URL          |
      | Terms of Service | scopely.com/tos/      |
      | Privacy Policy   | scopely.com/privacy/  |
      | Cookies          | Interactive element   |

  @landing_page @language_selection
  Scenario: Landing page offers language selection
    When I look at the footer area
    Then I should see a language selector
    And the current language should display "English" with a flag icon
    And there should be a dropdown arrow indicator
    When I click on the language selector
    Then I should see available language options for the portal

  @landing_page @responsive_loading
  Scenario: Landing page loads efficiently on different connections
    When I visit the site
    Then critical content should load within 3 seconds
    And images should load progressively
    And the page should remain interactive during loading
    And there should be no layout shift after initial render

  @landing_page @authentication_prompt
  Scenario: Restricted sections prompt for authentication
    Given I am not logged in
    When I click on a restricted menu item like "Store"
    Then I should see a modal dialog appear
    And the modal should contain sign-in prompt specific to that section
    And I should see "Sign in with Scopely" button in the modal
    And I should be able to close the modal with X button or ESC key

  @landing_page @news_preview_limit
  Scenario: Landing page limits initial news display
    Given I am viewing "Latest News & Updates" section
    When the initial articles are loaded
    Then I should see exactly 8 news article previews
    And I should see a "Show More" button at the bottom
    When I click "Show More"
    Then additional news articles should load dynamically
    And the page should not refresh

  @landing_page @visual_hierarchy
  Scenario: Landing page maintains clear visual hierarchy
    When I view the entire landing page
    Then the visual hierarchy should be:
      | Order | Section                    | Purpose                        |
      | 1     | Hero banner with news      | Highlight latest update       |
      | 2     | Promotional cards          | Drive store engagement        |
      | 3     | News grid                  | Show game activity            |
      | 4     | Footer with links          | Provide additional resources |
    And each section should be clearly separated
    And the call-to-action buttons should be prominently styled