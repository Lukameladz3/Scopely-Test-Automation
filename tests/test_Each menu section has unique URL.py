from utils.config import Config
from playwright.sync_api import expect

def test_each_menu_section_has_unique_URL(home_page, login_page):
    home_page.click_login_button()
    login_page.login_into_account(Config.VALID_USERNAME, Config.VALID_PASSWORD)
    home_page.click_store_link()
    home_page.click_got_it_button()
    expect(home_page.page).to_have_url(f"{Config.BASE_URL}/store")
    home_page.click_events_link()
    expect(home_page.page).to_have_url(f"{Config.BASE_URL}/events")
    home_page.click_reedem_code_link()
    expect(home_page.page).to_have_url(f"{Config.BASE_URL}/redeem-code")
    home_page.click_news_link()
    expect(home_page.page).to_have_url(f"{Config.BASE_URL}/news")
