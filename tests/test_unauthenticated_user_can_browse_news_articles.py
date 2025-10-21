from utils.config import Config
import time

def test_unauthenticated_user_can_browse_news_articles(home_page):

    news_count = home_page.get_news().count()
    assert news_count >= 8
    for i in range(news_count):
        assert home_page.check_if_article_contains_defined_structure(i) == True, f'News article at index {i} does not contain the defined structure'
    
    home_page.click_show_more_button()
    
    assert home_page.click_show_more_and_wait_for_new_cards(news_count) >= news_count



