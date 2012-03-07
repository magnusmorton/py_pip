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
        rows = len(self._py_domain)
        cols = len(self._py_domain[0])
        self._domain = pip.pip_matrix_alloc(rows, cols)
        self._options = pip.pip_options_init()
        for i in range(rows):
            for j in range(cols):
                self._domain.p[i][j] = self._py_domain[i][j]
                
        
                
    
    def dump(self):
        pip.pip_matrix_print(libc.stdio.stdout, self._domain)
        
    
        
        
    