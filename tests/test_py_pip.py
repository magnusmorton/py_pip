import unittest
from py_pip import *

class TestProblem(unittest.TestCase):
    
    def setUp(self):
        pass
        
    def test_can_create_problem(self):
        problem = Problem()
        assert problem is not None, "Problem doesn't exist"