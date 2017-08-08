#include <Python.h>
#include "getprime.h"


static char module_docstring[] =
    "This module provides a way of calculate prime numbers";
static char prime_docstring[] =
    "Says if a number is prime";
static char yieldprime_docstring[] =
    "Calculate the nth prime number";


static PyObject *getprime_prime(PyObject *self, PyObject *args);
static PyObject *getprime_yieldprime(PyObject *self, PyObject *args);


static PyMethodDef module_methods[] = {
    {"prime", getprime_prime, METH_VARARGS, prime_docstring},
    {"yieldprime", getprime_yieldprime, METH_VARARGS, yieldprime_docstring},
    {NULL, NULL, 0, NULL}
};


PyMODINIT_FUNC init_getprime(void) {
    PyObject *m = Py_InitModule3("_getprime", module_methods, module_docstring);
    if (m == NULL)
        return;
}


static PyObject *getprime_prime(PyObject *self, PyObject *args) {
    int a;

    if (!PyArg_ParseTuple(args, "i", &a))
        return NULL;

    int value = prime(a);

    PyObject *ret = Py_BuildValue("i", value);
    return ret;
}


static PyObject *getprime_yieldprime(PyObject *self, PyObject *args) {
    int a;

    if (!PyArg_ParseTuple(args, "i", &a))
        return NULL;

    int value = yieldprime(a);

    PyObject *ret = Py_BuildValue("i", value);
    return ret;
}
