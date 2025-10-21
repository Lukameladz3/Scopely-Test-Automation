Feature: Star Trek Fleet Command Web Portal
  As a player of Star Trek Fleet Command
  I want to use the web portal
  So that I can manage my game account and access exclusive features

  Background:
    Given I am on the Star Trek Fleet Command home page

  @authentication @smoke
  Scenario: User can sign in with Scopely account
    When I click on the "Sign in with Scopely" button
    And I enter "yauheni.kurhanau.a1qa@gmail.com" in the email field
    And I click the "Continue" button
    And I enter valid password in the password field
    And I click the "Sign in" button
    Then I should be redirected to the home page
    And I should see the main navigation menu

  @navigation @smoke
  Scenario: User can navigate through main menu sections
    When I view the main navigation menu
    Then I should see the following menu items:
      | Menu Item    |
      | Home         |
      | Store        |
      | Events       |
      | Redeem Code  |
      | News         |
    And each menu item should be clickable

  @store @authentication_required
  Scenario: Accessing store requires authentication
    Given I am not logged in
    When I click on the "Store" menu item
    Then I should see a modal dialog
    And the dialog should display "Sign in with Scopely to Visit the Store"
    And I should see a "Sign in with Scopely" button in the dialog

  @events @authentication_required
  Scenario: Accessing events section requires authentication
    Given I am not logged in
    When I click on the "Events" menu item
    Then I should see a modal dialog
    And the dialog should display "Sign in with Scopely to play the events"
    And I should see a "Sign in with Scopely" button in the dialog

  @redeem_code @authentication_required
  Scenario: Redeeming codes requires authentication
    Given I am not logged in
    When I click on the "Redeem Code" menu item
    Then I should see a modal dialog
    And the dialog should display "Sign in with Scopely to receive rewards"
    And I should see a "Sign in with Scopely" button in the dialog

  @news @content
  Scenario: User can view latest news and updates
    When I am on the home page
    Then I should see "Latest News & Updates" section
    And I should see news articles with:
      | Element           |
      | Article date      |
      | Article title     |
      | Article preview   |
      | Read more link    |
    And I should see a "Show More" button to load additional articles

  @news @navigation
  Scenario: User can navigate to full news section
    When I click on the "News" menu item
    Then I should be redirected to the news page
    And the URL should contain "/news"
    And I should see a list of news articles

  @promotional @content
  Scenario: Home page displays promotional offers
    When I am on the home page
    Then I should see promotional banners with:
      | Banner Text                      |
      | FEATURED - Explore the Web Store |
      | PC & WEB EXCLUSIVE - Get Multiphasic Credits |
    And each promotional banner should have a "GO TO STORE" button

  @footer @links
  Scenario: Footer contains important links and information
    When I scroll to the footer section
    Then I should see the following links:
      | Link Type         | Expected URL/Content                                    |
      | Terms of Service  | https://scopely.com/tos/                              |
      | Privacy Policy    | https://scopely.com/privacy/                          |
      | Cookies           | Clickable element                                      |
      | Facebook          | https://www.facebook.com/StarTrekFleetCommand         |
      | YouTube           | https://www.youtube.com/channel/UCaPdLI1d-6LveN5w0kmtroA |
      | Twitter           | https://twitter.com/StarTrekFleet                     |
      | Instagram         | https://www.instagram.com/startrekfleetcommand/       |
      | Discord           | http://discord.gg/stfc                                |
    And I should see copyright text containing "© 2025 CBS Broadcasting Inc."

  @mobile_apps @download
  Scenario: User can access mobile app download links
    When I view the sidebar section
    Then I should see "PLAY ON YOUR COMPUTER" section with "Windows and Mac Supported" text
    And I should see download links for:
      | Platform   | Link URL                                                      |
      | App Store  | https://apps.apple.com/us/app/star-trek-fleet-command/id1427744264 |
      | Play Store | https://play.google.com/store/apps/details?id=com.scopely.startrek |
    And each download link should display the appropriate store badge image