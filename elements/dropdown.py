from playwright.sync_api import Locator
from .base_element import BaseElement

class Dropdown(BaseElement):
    def __init__(self, locator: Locator):
        super().__init__(locator)

    def select_option(self, option):
        self.locator.select_option(label=option)

    def get_selected_text(self) -> str:
        return self.locator.locator("option:checked").text_content()