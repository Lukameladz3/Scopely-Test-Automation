from playwright.sync_api import Locator

class BaseElement:
    def __init__(self, locator: Locator):
        self.locator = locator

    def is_visible(self):
        return self.locator.is_visible()

    def click(self):
        self.locator.click()

    def is_clickable(self) -> bool:
        try:
            visible = self.locator.is_visible()
            enabled = self.locator.is_enabled()
            href = self.locator.get_attribute("href")

            if href is not None:
                return visible and enabled and href.strip() != ""

            return visible and enabled
        except Exception:
            return False