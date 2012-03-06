cimport pip

cdef class Problem:
    cdef int _unknowns_count
    cdef _domain
    def __cinit__(self, unknowns_count=0):
        self._domain = []
        self._unknowns_count = unknowns_count
        
    @property
    def unknowns_count(self):
        return self._unknowns_count
        
    
    def get_domain(self):
        return self._domain
        
    def set_domain(self, matrix):
        self._domain = matrix
        
    domain = property(get_domain, set_domain)
        
    
        
        
    