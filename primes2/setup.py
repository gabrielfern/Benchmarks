from distutils.core import setup, Extension

ext = Extension("_getprime", ["_getprime.c", "getprime.c"])

setup(
    ext_modules=[ext],
)
