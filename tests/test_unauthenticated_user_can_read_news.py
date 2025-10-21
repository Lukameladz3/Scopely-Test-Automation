from utils.config import Config
import time

def test_unauthenticated_user_can_read_news(home_page, news_page, sign_in_popup):
    home_page.news_button.click()
    assert home_page.page.url == f"{Config.BASE_URL}/news"
    news_page.click_read_more_on_random_article()
    assert news_page.is_article_displayed() == True, 'News article content should be displayed'
    assert sign_in_popup.is_sign_in_popup_displayed() == False, 'Sign In popup should not be displayed'
    assert "news" in news_page.page.url


