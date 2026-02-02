from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.support.events import AbstractEventListener


class ExampleEventFiringListener(AbstractEventListener):
    def before_navigate_to(self, url, driver):
        leaving_page_title = driver.title
        logger.info(f"About to leave the '{leaving_page_title}' page")

    def after_navigate_to(self, url, driver):
        current_page_title = driver.title
        logger.info(f"Just arrived at '{current_page_title}' page")
