
def test_unauthenticated_user_cannot_access_restricted_features(home_page, sign_in_popup):
    home_page.click_store_link()
    assert sign_in_popup.is_sign_in_popup_displayed(), 'Unauthenticated user should see sign in popup after clicking store link'
    assert sign_in_popup.is_close_popup_button_displayed(), 'close button should be displayed in sign in popup'
    sign_in_popup.click_outside_model()

    home_page.click_events_link()
    assert sign_in_popup.is_sign_in_popup_displayed(), 'Unauthenticated user should see sign in popup after clicking events link'
    assert sign_in_popup.is_close_popup_button_displayed(), 'close button should be displayed in sign in popup'
    sign_in_popup.click_outside_model()

    home_page.click_reedem_code_link()
    assert sign_in_popup.is_sign_in_popup_displayed(), 'Unauthenticated user should see sign in popup after clicking events link'
    assert sign_in_popup.is_close_popup_button_displayed(), 'close button should be displayed in sign in popup'
    sign_in_popup.click_outside_model()


