
cdef class UtilityCode:
    cdef public object proto
    cdef public object impl
    cdef public object init
    cdef public object cleanup
    cdef public object requires
    cdef public dict _cache
    cdef public list specialize_list
    cdef public object proto_block

    cpdef put_code(self, dict output)

cdef class FunctionState:
    cdef public set names_taken
    cdef public object owner

    cdef public object error_label
    cdef public Py_ssize_t label_counter
    cdef public set labels_used
    cdef public object return_label
    cdef public object continue_label
    cdef public object break_label

    cdef public object return_from_error_cleanup_label # not used in __init__ ?

    cdef public bint in_try_finally
    cdef public object exc_vars

    cdef public list temps_allocated
    cdef public dict temps_free
    cdef public dict temps_used_type
    cdef public Py_ssize_t temp_counter

    cpdef tuple get_loop_labels(self)
    cpdef set_loop_labels(self, labels)
    cpdef tuple get_all_labels(self)
    cpdef set_all_labels(self, labels)

    cpdef list temps_in_use(self)

cdef class IntConst:
    cdef public object cname
    cdef public object value
    cdef public bint is_long

cdef class PyObjectConst:
    cdef public object cname
    cdef public object type

cdef class StringConst:
    cdef public object cname
    cdef public object text
    cdef public object escaped_value
    cdef public dict py_strings

## cdef class PyStringConst:
##     cdef public object cname
##     cdef public object encoding
##     cdef public bint is_str
##     cdef public bint is_unicode
##     cdef public bint intern

#class GlobalState(object):

#def funccontext_property(name):

#class CCodeWriter(object):

cdef class PyrexCodeWriter:
    cdef public object f
    cdef public Py_ssize_t level