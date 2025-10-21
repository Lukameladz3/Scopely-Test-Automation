from playwright.sync_api import Page, Locator, expect
from .base_page import BasePage
from elements.button import Button
import random

class SignInPopup(BasePage):
    def __init__(self, page:Page):
        super().__init__(page)
        self.sign_in_popup_locator = self.page.locator('[aria-labelledby="authorization dialog"]')
        self.close_popup_button = Button(self.page.locator('[data-testid="modal-close-button"]'))

    def is_sign_in_popup_displayed(self) -> bool:
        return self.sign_in_popup_locator.is_visible()
    
    def is_close_popup_button_displayed(self):
        return self.close_popup_button.is_visible()
    
    def click_outside_model(self):
        popup_locator = self.sign_in_popup_locator
        expect(popup_locator).to_be_visible()

        bbox = popup_locator.bounding_box()
        
        if not bbox:
            raise Exception("Could not find the bounding box for the pop-up.")
        
        outside_x = bbox['x'] + bbox['width'] + 5
        
        outside_y = bbox['y'] + (bbox['height'] / 2)
        
        viewport_size = self.page.viewport_size
        if not viewport_size or outside_x >= viewport_size['width']:
            outside_x = bbox['x'] - 5
            outside_x = max(outside_x, 1)

        self.page.mouse.click(outside_x, outside_y)
        
        expect(popup_locator).not_to_be_visible()
