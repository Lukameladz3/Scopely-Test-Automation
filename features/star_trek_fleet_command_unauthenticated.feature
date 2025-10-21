Feature: Star Trek Fleet Command Web Portal - Unauthenticated User Journey
  As a visitor to Star Trek Fleet Command web portal
  I want to explore available content without logging in
  So that I can learn about the game before creating an account

  Background:
    Given I am on the Star Trek Fleet Command home page
    And I am not logged in

  # finished
  @unauthenticated @homepage @s_view_content
  Scenario: Unauthenticated user can view homepage content
    Then I should see the Star Trek Fleet Command logo
    And I should see the main banner with latest update information
    And I should see "Sign in with Scopely" button in the header
    And I should not see any user profile information
    And I should see promotional content for the web store

  # finished
  @unauthenticated @news_browsing
  Scenario: Unauthenticated user can browse news articles
    When I scroll to the "Latest News & Updates" section
    Then I should see at least 8 news article previews
    And each news article should display:
      | Element                |
      | Publication date       |
      | Article title          |
      | Article description    |
      | #News tag              |
      | Read more link         |
    When I click "Show More" button
    Then additional news articles should load

  #finished
  @unauthenticated @news_reading
  Scenario: Unauthenticated user can read full news articles
    When I click on any news article's "Read more" link
    Then I should be redirected to the full article page
    And I should be able to read the complete article content
    And I should not be prompted to sign in
    And the URL should contain "/news/"

  @unauthenticated @cookie_banner
  Scenario: Unauthenticated user sees cookie consent banner
    When I visit the site for the first time
    Then I should see a cookie consent dialog with:
      | Element                |
      | Privacy heading        |
      | Cookie policy text     |
      | Accept Cookies button  |
      | Decline All button     |
      | Manage Settings button |
    And the dialog should explain cookie usage for services and advertising

  # finished
  @unauthenticated @language_selector
  Scenario: Unauthenticated user can access language selector
    When I look at the footer section
    Then I should see a language selector showing "English"
    And I should see a flag icon next to the language
    And the language selector should have a dropdown arrow
    When I click on the language selector
    Then I should see available language options

  @unauthenticated @social_media
  Scenario: Unauthenticated user can access social media links
    When I look at the footer section
    Then I should see social media icons for:
      | Platform  |
      | Facebook  |
      | YouTube   |
      | Twitter   |
      | Instagram |
      | Discord   |
    And each social media icon should be clickable
    And clicking any icon should open the respective social media page in a new tab

  # not finished
  @unauthenticated @game_download
  Scenario: Unauthenticated user can view game download options
    When I look at the sidebar
    Then I should see "PLAY ON YOUR COMPUTER" text
    And I should see "Windows and Mac Supported" description
    And I should see App Store download badge
    And I should see Google Play Store download badge
    And both badges should be clickable links

  # finished
  @unauthenticated @restricted_features
  Scenario: Unauthenticated user cannot access restricted features
    When I attempt to access restricted features
    Then the following actions should trigger authentication prompts:
      | Action               | Expected Modal Text                           |
      | Click Store          | Sign in with Scopely to Visit the Store      |
      | Click Events         | Sign in with Scopely to play the events      |
      | Click Redeem Code    | Sign in with Scopely to receive rewards      |
    And each modal should have a close button (X)
    And clicking outside the modal should close it

  # finished
  @unauthenticated @authentication_flow
  Scenario: Unauthenticated user can initiate sign-in process
    When I click on "Sign in with Scopely" button
    Then I should be redirected to Scopely authentication page
    And the URL should contain "id.scopely.com"
    And I should see "Let's get you in!" heading
    And I should see email input field with placeholder "your.email@example.com"
    And I should see "Continue" button (initially disabled)
    And I should see information about Scopely Account benefits

  @unauthenticated @seo_content
  Scenario: Unauthenticated user can see SEO and legal information
    When I scroll to the bottom of the page
    Then I should see copyright notice "© 2025 CBS Broadcasting Inc. and Paramount Pictures Corporation"
    And I should see "Game Software © 2025 Scopely, Inc."
    And I should see clickable "Terms of Service" link
    And I should see clickable "Privacy Policy" link
    And I should see "Cookies" option
    And the page title should be "STAR TREK Fleet Command"