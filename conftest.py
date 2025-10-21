import pytest
from playwright.sync_api import Page
from utils.config import Config
from pages.home_page import HomePage
from pages.news_page import NewsPage
from pages.sign_in_popup import SignInPopup
from pages.login_page import LoginPage

@pytest.fixture(scope="session")
def browser_type_launch_args():
    return {
        "headless": Config.HEADLESS,
        "channel": Config.BROWSER,
    }

@pytest.fixture(scope="session")
def browser_context_args():
    return {
        "viewport": { "width": Config.DEFAULT_BROWSER_WINDOW_WIDTH, "height": Config.DEFAULT_BROWSER_WINDOW_HEIGHT }
    }

@pytest.fixture
def home_page(page: Page):
    page.goto(Config.BASE_URL)
    return HomePage(page)

@pytest.fixture
def news_page(page: Page):
    return NewsPage(page)

@pytest.fixture
def sign_in_popup(page: Page):
    return SignInPopup(page)

@pytest.fixture
def login_page(page: Page):
    return LoginPage(page)