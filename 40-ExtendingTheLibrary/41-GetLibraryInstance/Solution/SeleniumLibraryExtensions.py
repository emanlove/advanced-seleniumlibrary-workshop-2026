from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn


def get_current_browser_capabilities():
    logger.info('Getting currently open browser desired capabilities')
    sl = BuiltIn().get_library_instance('SeleniumLibrary')
    return sl.driver.capabilities