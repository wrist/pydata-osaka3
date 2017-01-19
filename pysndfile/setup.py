from distutils.core import setup, Extension
from Cython.Build import cythonize
import numpy

# First create an Extension object with the appropriate name and sources
ext = Extension(name="pysndfile",
                sources=["pysndfile.pyx"],
                libraries=["sndfile"],
                include_dirs=["/Users/wrist/work/c/libsndfile/libsndfile/src",
                              numpy.get_include()],
                extra_link_args=["-L/Users/wrist/work/c/libsndfile/libsndfile/src/.libs"])

# Use cythonize on the extension object.
setup(ext_modules=cythonize(ext))
