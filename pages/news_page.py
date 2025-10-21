from playwright.sync_api import Page
from .base_page import BasePage
from elements.button import Button
import random
import time

class NewsPage(BasePage):
    def __init__(self, page:Page):
        super().__init__(page)
        self.news_article_locator = "[name='news-card']"
        self.news_articles = self.page.locator(self.news_article_locator)
        self.inside_news_article = self.page.locator(".WP-NewsDetails-content")

    def click_read_more_on_random_article(self):
        try:
            self.page.wait_for_selector(self.news_article_locator, timeout=5000)
        except TimeoutError:
            raise ValueError("No news articles found after waiting 5s")
        count = self.news_articles.count()
        index = random.randrange(count)
        article = self.news_articles.nth(index)
        read_more_button = Button(article.get_by_text("Read more"))
        read_more_button.click()
    
    def is_article_displayed(self) -> bool:
        self.inside_news_article.wait_for(state="visible", timeout=5000)
        return self.inside_news_article.is_visible()