from playwright.sync_api import Locator
from .base_element import BaseElement

class Input(BaseElement):
    def __init__(self, locator: Locator):
        super().__init__(locator)

    def fill(self, value: str):
        self.locator.fill(value)

    def is_enabled(self):
        return self.locator.is_enabled()

    def get_value(self):
        return self.locator.input_value()
    
    def upload_file(self, file_location):
        self.locator.set_input_files(file_location)