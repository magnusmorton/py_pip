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
        pip.pip_quast_print(libc.stdio.stdout, sol, 1)
        libc.stdio.printf("%d\n",sol.list)
        return wrapped_solution
    
    def dump(self):
        pip.pip_matrix_print(libc.stdio.stdout, self._domain)
        

cdef class Solution:
    cdef pip.PipQuast *_solution
    
    cdef add_solution(self, pip.PipQuast *solution):
        self._solution = solution
    
    @property
    def solution_exists(self):
        if self._solution.condition is not NULL or self._solution.list is not NULL:
            return True
        else:
            return False
    
        
        
    