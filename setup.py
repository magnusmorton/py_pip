'''
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
from Cython.Distutils import build_ext
from setuptools import setup, Extension

setup (name = 'PythonPipLib',
       version = '0.1',
       description = 'Parametric Integer Programming native wrapper',
       cmdclass = {'build_ext':build_ext},
       ext_modules = [Extension("py_pip", ["py_pip.pyx", "pip.pxd"],
                        libraries=["piplib64"])],
       test_suite = "tests",
       install_requires = ['Cython>=0.15.1']
       )