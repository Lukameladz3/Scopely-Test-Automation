
def test_unauthenticated_user_can_view_homepage_content(home_page):
    assert home_page.is_logo_displayed(), 'Star Trek Fleet Command logo should be displayed on the homepage'
    assert home_page.is_main_banner_displayed(), 'Main banner should be visible on the homepage'
    assert home_page.is_promotional_content_displayed(), 'Promotional content should be visible on the homepage'
    assert home_page.are_download_options_clickable(), 'Download options should be clickable on the homepage'