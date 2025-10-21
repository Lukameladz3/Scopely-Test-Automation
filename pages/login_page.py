from pages.base_page import BasePage
from playwright.sync_api import Page
from elements.input import Input
from elements.button import Button

class LoginPage(BasePage):
    def __init__(self, page:Page):
        super().__init__(page)
        self.title = self.page.locator(".title")
        self.email_input = Input(self.page.locator("[name='email']"))
        self.password_input = Input(self.page.locator('[data-test-id="InputPassword"]'))
        self.sign_in_button = Button(self.page.locator('.submitButton'))
        self.continue_button = Button(self.page.locator("[data-test-id='site-email-input-submit-button']"))
        self.benefits = self.page.locator('#value-proposition')
    
    def is_title_visible(self) -> bool:
        self.title.wait_for(state="visible", timeout=5000)
        return self.title.is_visible()
    
    def get_title(self) -> str:
        return self.title.inner_text()
    
    def is_continue_button_enabled(self) -> bool:
        return self.continue_button.is_enabled()
    
    def are_benefits_visible(self):
        return self.benefits.is_visible()
    
    def enter_email(self,email:str):
        self.email_input.fill(email)

    def click_continue_button(self):
        self.continue_button.click()

    def enter_passwor(self, password:str):
        self.password_input.fill(password)
    
    def login_into_account(self, username, password):
        self.email_input.fill(username)
        self.continue_button.click()
        self.password_input.fill(password)
        self.sign_in_button.click()