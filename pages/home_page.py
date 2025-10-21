from playwright.sync_api import Page, expect
from .base_page import BasePage
from elements.button import Button  
from elements.base_element import BaseElement
import re
class HomePage(BasePage):
    def __init__(self, page:Page):
        super().__init__(page)
        self.news_button = Button(self.page.locator("#navigation-item-to-news"))
        self.latest_news_header = self.page.get_by_text("Latest News & Updates")
        self.news_cards = self.page.locator("[name='news-card']")
        self.show_more_button = Button(self.page.locator("#show-more-news-button"))

        self.star_trek_fleet_command_logo = self.page.locator("#logo-button")
        self.main_banner = self.page.locator(".WP-Banner-title")
        self.login_button = Button(self.page.locator("#log-in-button"))
        self.promotional_content_button = self.page.locator(".WP-SpecialOffer-button")

        self.play_on_your_computer_button = Button(self.page.locator("#play-on-pc-button"))
        self.ios_market_link = BaseElement(self.page.locator("#ios-market-link"))
        self.android_market_link = BaseElement(self.page.locator("#android-market-link"))

        #side bar
        self.language_dropdown = self.page.locator("#language-select")
        self.dropdown_language_flag = self.page.locator(".WP-LanguageDropDown-select-flag")
        self.dropdown_arrow = self.page.locator(".WP-LanguageDropdown-arrow")
        self.language_options_more = self.page.locator(".lang-menu")

        # side bar
        self.store_link = self.page.locator('#navigation-item-to-store')
        self.events_link = self.page.locator('#navigation-item-to-events')
        self.reedem_code_link = self.page.locator('#navigation-item-to-redeem-code')

        # side bar
        self.copyright_notice = self.page.locator('#copyright-title-text')

        # store page
        self.got_it_button = self.page.locator('.shepherd-button')

    def get_news(self):
        self.latest_news_header.scroll_into_view_if_needed()
        self.page.wait_for_selector("[name='news-card']", timeout=5000)
        return self.news_cards

    def check_if_article_contains_defined_structure(self, index) -> bool:
        article = self.news_cards.nth(index)
        date = article.locator(".WP-NewsCard-date").is_visible();
        title = article.locator(".WP-NewsCard-title").is_visible();
        description = article.locator(".WP-NewsCard-description").is_visible();
        read_more_button = article.get_by_text("Read more").is_visible();
        image = article.locator(".WP-NewsCard-image").is_visible();
        tag = article.locator(".WP-NewsCard-Link-wrapper").is_visible();

        return (date and title and description and read_more_button and image and tag)

    def click_show_more_and_wait_for_new_cards(self, initial_count: int, timeout: int = 5000) -> int:
        self.page.wait_for_selector("[name='news-card']", timeout=timeout)

        try:
            self.page.wait_for_function(
                "(initial) => document.querySelectorAll(" + "\"[name='news-card']\"" + ").length > initial",
                arg=initial_count,
                timeout=timeout,
            )
        except Exception:
            raise TimeoutError(f"No new news cards appeared within {timeout} ms after clicking Show more")

        return self.news_cards.count()
    
    def click_show_more_button(self):
        self.show_more_button.click()

    def is_logo_displayed(self) -> bool:
        self.star_trek_fleet_command_logo.wait_for(state="visible", timeout=5000 )
        return self.star_trek_fleet_command_logo.is_visible()
    
    def is_main_banner_displayed(self) -> bool:
        self.main_banner.wait_for(state="visible", timeout=5000 )
        return self.main_banner.is_visible()
    
    def is_login_button_displayed(self) -> bool:
        return self.login_button.is_visible()
    
    def is_promotional_content_displayed(self) -> bool:
        return self.promotional_content_button.first.is_visible()

    def is_play_on_your_computer_button_displayed(self) -> bool:
        return self.play_on_your_computer_button.is_visible()
    
    def is_ios_market_link_displayed(self) -> bool:
        return self.ios_market_link.is_visible()
    
    def is_android_market_link_displayed(self) -> bool:
        return self.android_market_link.is_visible()
    
    def are_download_options_clickable(self) -> bool:
        return self.ios_market_link.is_clickable() and self.android_market_link.is_clickable()
    
    def click_login_button(self):
        self.login_button.click()

    #sidebar
    def get_dropdown_text(self) -> str:
        return self.language_dropdown.inner_text()
    
    def is_dropdown_language_flag_displayed(self) -> bool:
        return self.dropdown_language_flag.is_visible()
    
    def is_dropdown_arrow_displayed(self) -> bool:
        return self.dropdown_arrow.is_visible()
    
    def click_on_language_dropdown(self):
        self.language_dropdown.click()



    def are_other_language_options_displayed(self):
        self.language_options_more.scroll_into_view_if_needed()
        expect(self.language_options_more).not_to_have_count(0)
        return self.language_options_more.is_visible()

    def click_store_link(self):
        self.store_link.click()

    def is_url_correct(self, url:str):
        return expect(self.page.url).to_have_url(re.compile(f'**{url}*'))

    
    def click_events_link(self):
        self.events_link.click()

    def click_reedem_code_link(self):
        self.reedem_code_link.click()

    def click_news_link(self):
        self.news_button.click()

    def copyright_notice_contains(self, text):
        return expect(self.copyright_notice).to_contain_text(text)
    
    def click_got_it_button(self):
        self.got_it_button.click()