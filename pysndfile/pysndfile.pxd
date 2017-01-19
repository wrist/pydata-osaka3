from libc.stdint cimport int64_t

cdef extern from "sndfile.h":
    ctypedef int64_t sf_count_t

    cdef struct SNDFILE_tag:
       pass
    ctypedef SNDFILE_tag SNDFILE

    cdef struct SF_INFO:
       sf_count_t      frames
       int             samplerate
       int             channels
       int             format
       int             sections
       int             seekable

    cdef enum:
        # True and false
        SF_FALSE        = 0,
        SF_TRUE         = 1,

        # modes for opening files
        SFM_READ        = 0x10,
        SFM_WRITE       = 0x20,
        SFM_RDWR        = 0x30,

        SF_AMBISONIC_NONE               = 0x40,
        SF_AMBISONIC_B_FORMAT   = 0x41

    cdef SNDFILE* sf_open (const char *path, int mode, SF_INFO *sfinfo)
    int sf_close(SNDFILE *sndfile)
    sf_count_t sf_read_float(SNDFILE *sndfile, float *ptr, sf_count_t items)
