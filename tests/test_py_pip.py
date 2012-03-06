import unittest
from py_pip import *

class TestProblem(unittest.TestCase):
    
    def setUp(self):
        self.problem = Problem()
        
    def test_can_create_problem(self):
        
        assert self.problem is not None, "Problem doesn't exist"
        
    # def test_add_constraints(self):
    #         a