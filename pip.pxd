cdef extern from '<piplib/piplib.h>':
    ctypedef int Entier
    
    # Types
    struct pipmatrix:    
        unsigned NbRows, NbColumns
        Entier **p 
        Entier *p_Init 
        int p_Init_size
        
    ctypedef pipmatrix PipMatrix
    
    struct pipoptions:
        int Nq 
        int Verbose
        int Simplify
        int Deepest_cut
        int Maximize
        int Urs_parms
        int Urs_unknowns
        int Compute_dual
        
    ctypedef pipoptions PipOptions
    
    struct pipvector
        int nb_elements
        Entier * the_vector
        Entier * the_deno
    
    ctypedef pipvector PipVector
    
    struct pipnewparm:
        int rank
        PipVector * vector
        Entier deno 
        struct pipnewparm * next
        
    ctypedef pipnewparm PipNewparm
    
    struct piplist
        PipVector * vector 
        struct piplist * next 
    
    ctypedef piplist PipList
    
    struct pipquast:
        PipNewparm * newparm 
        PipList * list
        PipVector * condition
        struct pipquast * next_then
        struct pipquast * next_else
        struct pipquast * father 
        
    ctypedef pipquast PipQuast 
        
    
    # Functions
    PipMatrix * pip_matrix_alloc(unsigned, unsigned)
    PipOptions * pip_options_init(void)
    void pip_matrix_free(PipMatrix *)
    void pip_options_free(PipOptions *)
    
