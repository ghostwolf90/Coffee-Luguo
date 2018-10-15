import unittest
import os
from random import randint
from appium import webdriver
from time import sleep
from selenium.webdriver.common.keys import Keys

class LoginTests(unittest.TestCase):

    def setUp(self):                         
        app = ('/Users/laichongli/Library/Developer/Xcode/DerivedData/Coffee_Luguo-fphgosuwvglzdybzrsacxrmnulcz/Build/Products/Debug-iphonesimulator/Coffee Luguo.app')
        self.driver = webdriver.Remote(
            command_executor='http://127.0.0.1:4723/wd/hub',
            desired_capabilities={
                'app': app,
                'platformName': 'iOS',
                'platformVersion': '12.0',
                'deviceName': 'iPhone 6s'
            }
        )

    def tearDown(self):
        self.driver.quit()

    def testEmailField(self):
        self.driver.find_element_by_accessibility_id('startButton').click()

    if __name__ == '__main__':
        suite = unittest.TestLoader().loadTestsFromTestCase(LoginTests)
        unittest.TextTestRunner(verbosity=2).run(suite)