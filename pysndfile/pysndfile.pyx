# from pysndfile cimport *  # 不要
import numpy as np
cimport numpy as cnp

cdef class PySndfile:
    cdef SNDFILE* handle
    cdef str filepath
    cdef int mode
    cdef SF_INFO sf_info

    def __init__(PySndfile self):
       pass

    def __dealloc__(PySndfile self):
        self.close()

    def open(PySndfile self, str file_str, mode="r"):
        sf_mode = ""

        if mode == "r":
           sf_mode = SFM_READ
        elif mode == "w":
           sf_mode = SFM_WRITE
        elif mode == "Rw":
           sf_mode = SFM_RDWR

        self.handle = sf_open(file_str.encode(),
                              sf_mode,
                              &self.sf_info)

    def close(PySndfile self):
       if self.handle is not NULL:
          sf_close(self.handle)

    def read_frames(PySndfile self):
       cdef int channels = self.sf_info.channels
       cdef int frames =  self.sf_info.frames
       cdef int items = channels * frames
       cdef float[::1,:] col_memv

       data = np.zeros((channels, frames), dtype=np.float32, order="F")
       col_memv = data
       sf_read_float(self.handle, &col_memv[0,0], items)
       # cdef float[:,::1] row_memv = col_memv.T
       return np.asarray(col_memv, order="C")
