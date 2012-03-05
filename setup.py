from Cython.Distutils import build_ext
from setuptools import setup, Extension

setup (name = 'PythonPipLib',
       version = '0.1',
       description = 'Parametric Integer Programming native wrapper',
       cmdclass = {'build_ext':build_ext},
       ext_modules = [Extension("py_pip", ["py_pip.pyx", "pip.pxd"],
                        libraries=["piplib"])],
       test_suite = "tests",
       install_requires = ['Cython>=0.15.1']
       )