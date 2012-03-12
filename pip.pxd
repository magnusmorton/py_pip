'''
Some of this is derived directly from the original C headers, 
which are (c) Copyright Paul Feautrier, 1988-2005
Everything else:
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
cimport libc.stdio
cdef extern from '<piplib/piplib64.h>':
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
    
    struct pipvector:
        int nb_elements
        Entier * the_vector
        Entier * the_deno
    
    ctypedef pipvector PipVector
    
    struct pipnewparm:
        int rank
        PipVector * vector
        Entier deno 
        pipnewparm * next
        
    ctypedef pipnewparm PipNewparm
    
    struct piplist:
        PipVector * vector 
        piplist * next 
    
    ctypedef piplist PipList
    
    struct pipquast:
        PipNewparm * newparm 
        PipList * list
        PipVector * condition
        pipquast * next_then
        pipquast * next_else
        pipquast * father 
        
    ctypedef pipquast PipQuast 
        
    
    # Functions
    PipMatrix * pip_matrix_alloc(unsigned, unsigned)
    PipOptions * pip_options_init()
    void pip_matrix_free(PipMatrix *)
    void pip_options_free(PipOptions *)
    void pip_quast_free(PipQuast *)
    void pip_matrix_print(libc.stdio.FILE *, PipMatrix *)
    PipQuast * pip_solve(PipMatrix *, PipMatrix *, int, PipOptions *)
    void pip_quast_print(libc.stdio.FILE *, PipQuast *, int)
    
