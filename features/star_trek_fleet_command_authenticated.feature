Feature: Star Trek Fleet Command Web Portal - Authenticated User with Linked Account
  As an authenticated player with a linked Star Trek Fleet Command account
  I want to access all portal features and manage my game
  So that I can enhance my gaming experience through the web portal

  Background:
    Given I am logged in with a linked game account
    And I am on the Star Trek Fleet Command home page

  @authenticated @profile
  Scenario: User can view their game profile information
    When I look at the header section
    Then I should see my game username "Officer Bon2623587"
    And I should see a profile dropdown arrow next to my username
    When I click on my username
    Then I should see a profile dropdown menu with:
      | Option                  |
      | LOG OUT button          |
      | Allow Notifications     |
      | Notification settings   |

  @authenticated @home @in_game_news
  Scenario: User can view in-game news on home page
    When I am on the home page
    Then I should see "Latest In-game News" section
    And I should see in-game news items with:
      | Element            |
      | Time ago indicator |
      | News category      |
      | News title         |
      | Read more link     |
    And each news item should be clickable

  @authenticated @store @categories
  Scenario: User can browse store categories
    When I navigate to the Store section
    Then I should see store category tabs:
      | Category             |
      | Featured             |
      | Web Gifts            |
      | Ships                |
      | Station & Buildings  |
    And I should see a number badge on "Web Gifts" tab showing available items
    And the "Featured" tab should be selected by default

  @authenticated @store @search
  Scenario: User can search for items in the store
    Given I am in the Store section
    Then I should see a search bar with placeholder "Search the store"
    When I click on the search bar
    Then I should see a tooltip explaining search functionality
    And the tooltip should mention searching by resource, material, name, or group

  @authenticated @store @offers
  Scenario: User can view detailed offer information
    Given I am in the Store section
    When I view any offer bundle
    Then I should see the following offer details:
      | Detail                      |
      | Bundle image                |
      | Bundle name                 |
      | Value multiplier (2x, 3.8x) |
      | Time remaining              |
      | Multiphasic credits earned  |
      | Items left counter          |
      | Price in local currency     |
      | Original price (if on sale) |

  @authenticated @store @purchase
  Scenario: User can initiate purchase of store items
    Given I am in the Store section
    When I view the "Ferengi Treasure Bundle"
    Then I should see a purchase button with price "24.99 PLN"
    And I should see "1 Left" indicator
    And I should see "Earn 530" multiphasic credits
    When I click the purchase button
    Then the payment process should be initiated

  @authenticated @events @empty_state
  Scenario: User sees appropriate message when no events are active
    When I navigate to the Events section
    Then I should see "No Events Active!" heading
    And I should see message "There are currently no events active. Check back soon for updates!"
    And I should see an events illustration image

  @authenticated @events @active
  Scenario: User can participate in active events when available
    Given there is an active event
    When I navigate to the Events section
    Then I should see active event details:
      | Detail              |
      | Event name          |
      | Time remaining      |
      | Event description   |
      | Rewards preview     |
      | Participation button|
    And I should be able to interact with the event

  @authenticated @redeem_code
  Scenario: User can redeem promotional codes
    When I navigate to the "Redeem Code" section
    Then I should see "Redeem Your Rewards" heading
    And I should see "Enter your code and get free in-game rewards" description
    And I should see an input field with placeholder "Enter your code"
    And I should see a "Redeem" button
    And I should see message "Rewards can be claimed in-game once your code has been verified"

  @authenticated @redeem_code @validation
  Scenario: Code redemption validates input
    Given I am in the "Redeem Code" section
    When I enter an invalid code "INVALID123"
    And I click the "Redeem" button
    Then I should see an error message about invalid code
    When I enter a valid code format
    And I click the "Redeem" button
    Then I should see a success message or processing indicator

  @authenticated @navigation @urls
  Scenario: Each menu section has unique URL
    When I navigate through different sections
    Then each section should have its own URL:
      | Section      | URL Path      |
      | Home         | /             |
      | Store        | /store        |
      | Events       | /events       |
      | Redeem Code  | /redeem-code  |
      | News         | /news         |
    And the active menu item should be highlighted

  @authenticated @notifications
  Scenario: User can manage notification settings
    When I click on my profile dropdown
    Then I should see "Allow Notifications" option
    And I should see a disabled checkbox for notifications
    And I should see message "Enable notifications on your browser settings and refresh the page."
    When browser notifications are enabled
    Then the checkbox should become interactive

  @authenticated @logout
  Scenario: User can log out from their account
    When I click on my profile dropdown
    And I click "LOG OUT" button
    Then I should be logged out
    And I should be redirected to the home page
    And I should see "Sign in with Scopely" button instead of my username
    And restricted sections should require authentication again

  @authenticated @store @filtering
  Scenario: User can filter store items by category
    Given I am in the Store section
    When I click on "Ships" category tab
    Then I should see only ship-related offers
    When I click on "Station & Buildings" tab
    Then I should see only station and building offers
    And the selected tab should be visually highlighted

  @authenticated @store @web_exclusive
  Scenario: User can identify web-exclusive offers
    Given I am in the Store section
    When I view offers in the "Web Gifts" category
    Then I should see "PC & WEB EXCLUSIVE" badges on applicable items
    And I should see special value indicators like "Best Value!" or "2X more value!"
    And exclusive offers should have unique pricing or bonuses

  @authenticated @home @news_navigation
  Scenario: User can load more news articles
    Given I am on the home page
    When I scroll to the "Latest News & Updates" section
    Then I should see initial set of news articles
    When I click "Show More" button
    Then additional news articles should load
    And the "Show More" button should remain available if more articles exist

  @authenticated @home @promotional_banners
  Scenario: User can interact with promotional banners
    Given I am on the home page
    When I view the promotional banners section
    Then I should see multiple promotional offers:
      | Banner Type                                |
      | FEATURED - Explore the Web Store          |
      | PC & WEB EXCLUSIVE - Get Multiphasic Credits |
    When I click "GO TO STORE" on any banner
    Then I should be redirected to the Store section

  @authenticated @responsive_design
  Scenario: Portal maintains functionality across different screen sizes
    Given I am viewing the portal
    When I resize the browser window
    Then the navigation menu should remain accessible
    And the store grid should adjust to screen width
    And all interactive elements should remain clickable
    And text should remain readable

  @authenticated @session_persistence
  Scenario: User session persists across page navigation
    Given I am logged in as "Officer Bon2623587"
    When I navigate to different sections:
      | Section     |
      | Store       |
      | Events      |
      | Redeem Code |
      | News        |
      | Home        |
    Then I should remain logged in throughout
    And my username should be displayed consistently
    And my session should not timeout during normal usage