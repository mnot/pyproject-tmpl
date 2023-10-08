

from proxy_tests.tests import tests


Class ProxyTestClient:
    def __init__(self):
        pass

    def start(self):
        for test in tests:
            run_test(test)

    def run_test(self):
        pass
