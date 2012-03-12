'''
(c) Copyright 2012 Magnus Morton.
This file is part of py_pip.

py_pip is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

py_pip is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with py_pip.  If not, see <http://www.gnu.org/licenses/>.
'''
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