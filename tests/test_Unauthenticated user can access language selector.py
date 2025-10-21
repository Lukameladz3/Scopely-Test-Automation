
def test_Unauthenticated_user_can_access_language_selector(home_page):
    assert home_page.get_dropdown_text() == "English", "default dropdown text should be english"
    assert home_page.is_dropdown_language_flag_displayed(), "language flag should be displayed on default"
    assert home_page.is_dropdown_arrow_displayed(), 'arrow should be displayed'
    home_page.click_on_language_dropdown()
    assert home_page.are_other_language_options_displayed(), 'other language options should be displayed'

