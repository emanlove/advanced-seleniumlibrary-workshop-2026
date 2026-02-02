from robot.api.deco import keyword
from selenium.webdriver.common.bidi.network import Request
from selenium.webdriver.common.webdriver import LocalWebDriver

class RequestHandler:
    ROBOT_LIBRARY_SCOPE = "TEST"
    ROBOT_AUTO_KEYWORDS = False

    @keyword
    def attach_request_handler(self, driver: LocalWebDriver) -> int:
        id = driver.network.add_request_handler("before_request", self.callback)
        return id

    def callback(self, request: Request) -> None:
        # TODO: Add a header "X-Robocon-Workshop-Custom-Header" to the request.
        # The value of the header doesn't matter.
        request.continue_request()
