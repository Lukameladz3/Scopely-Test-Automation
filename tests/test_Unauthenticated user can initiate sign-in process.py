

def test_unauthenticated_user_can_initiate_sign_in_process(home_page, login_page):
    home_page.click_login_button()
    assert login_page.is_title_visible(), 'Login page title should be visible after clicking login button'
    assert "id.scopely.com" in login_page.page.url, 'URL should contain the sign-in domain after clicking login button'
    assert login_page.get_title() == "Let's get you in!", 'Login page title text should match expected value'
    assert login_page.is_continue_button_enabled() == False, 'Continue button should be disabled before entering email'
    login_page.enter_email("test@example.us")
    login_page.click_continue_button()
    assert login_page.are_benefits_visible(), 'benefits should be visible after entering email and clicking continue'