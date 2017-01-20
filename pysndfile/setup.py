import os

from distutils.core import setup, Extension
from Cython.Build import cythonize
import numpy

libdir = ""

if os.uname().sysname == "Darwin":  # local machine
    libdir = "/Users/wrist/work/c/libsndfile/libsndfile"
else:  # on docker
    libdir = "/opt/notebooks/libsndfile"

ext = Extension(name="pysndfile",
                sources=["pysndfile.pyx"],
                libraries=["sndfile"],
                include_dirs=["{0}/src".format(libdir), numpy.get_include()],
                extra_link_args=["-L{0}/src/.libs".format(libdir)])

setup(ext_modules=cythonize(ext))
