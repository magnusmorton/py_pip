import unittest
from py_pip import *

class TestProblem(unittest.TestCase):
    
    INDEP = [[1, 1, 0, 0], [1, -1, 0, 10],[1,0, 1, 0],[1, 0, -1, 10],[0, 1, -1, 0],[1, 1, -1, -1],[1, -1, 1, -1]]
    DEP = [[1, 1, 0, 0], [1, -1, 0, 10],[1,0, 1, 0],[1, 0, -1, 10],[0, 1, -1, -1]]
    
            
            

    def setUp(self):
        self.problem = Problem()
        
    def test_can_create_problem(self):
        assert self.problem is not None, "Problem doesn't exist"
        
    def test_number_of_unknowns_set(self):
        problem = Problem(2)
        assert problem.unknowns_count == 2, "Wrong number of unknowns"
        
    def test_number_of_unknowns_set_when_3(self):
        problem = Problem(3)
        assert problem.unknowns_count == 3, "Wrong number of unknowns"
           
           
    def test_solve_runner(self):
        problem = Problem(2)
        problem.domain = TestProblem.INDEP
        problem.solve()
        problem.dump()
        
    def test_no_solution_when_independent(self):
        problem = Problem(2)
        problem.domain = TestProblem.INDEP
        solution = problem.solve()
        assert not solution.solution_exists, "solution found when none exists"
        
    def test_solution_when_dependent(self):
        problem = Problem(2)
        problem.domain = TestProblem.DEP
        solution = problem.solve()
        assert solution.solution_exists, "solution not found when one exists"
        
    def test_basic_independent(self):
        problem = Problem(2)
        problem.domain = TestProblem.INDEP
        assert problem.domain == TestProblem.INDEP, "Cannot assign domain"