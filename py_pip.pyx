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
cimport pip
cimport libc.stdio

cdef class Problem:
    cdef int _unknowns_count
    cdef _py_domain
    cdef pip.PipMatrix *_domain
    cdef pip.PipMatrix *_context
    cdef pip.PipOptions *_options
    
    def __cinit__(self, unknowns_count=0):
        self._py_domain = []
        self._unknowns_count = unknowns_count
        
    def __dealloc__(self):
        if self._domain is not NULL:
            pip.pip_matrix_free(self._domain)
            pip.pip_options_free(self._options)
        if self._context is not NULL:
            pip.pip_matrix_free(self._context)
            
        
    @property
    def unknowns_count(self):
        return self._unknowns_count
    
    def get_domain(self):
        return self._py_domain
        
    def set_domain(self, matrix):
        self._py_domain = matrix
        
    domain = property(get_domain, set_domain)
    
    
    def solve(Problem self):
        cdef int rows, cols
        cdef pip.PipQuast * sol
        rows = len(self._py_domain)
        cols = len(self._py_domain[0])
        self._domain = pip.pip_matrix_alloc(rows, cols)
        self._options = pip.pip_options_init()
        for i in range(rows):
            for j in range(cols):
                self._domain.p[i][j] = self._py_domain[i][j]
        sol = pip.pip_solve(self._domain, NULL,-1, self._options)
        wrapped_solution = Solution()
        wrapped_solution.add_solution(sol)
        return wrapped_solution
    
    def dump(self):
        pip.pip_matrix_print(libc.stdio.stdout, self._domain)
        

cdef class Solution:
    cdef pip.PipQuast *_solution
    
    def __dealloc__(self):
        if self._solution is not NULL:
            pip.pip_quast_free(self._solution)
    
    cdef add_solution(self, pip.PipQuast *solution):
        self._solution = solution
    
    @property
    def solution_exists(self):
        if self._solution.condition is not NULL or self._solution.list is not NULL:
            return True
        else:
            return False
    
        
        
    