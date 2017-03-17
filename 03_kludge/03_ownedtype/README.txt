Follow the four steps of kludging:

1. run:
kludge discover MyOwnedType MyOwnedType.h

2. manually edit generated kludge files if required.
in this case - an an include to the tests file to the end of the MyOwnedType.kludge.py
include('MyOwnedType.tests.kludge.py')

3. run:
kludge generate MyOwnedType MyOwnedType.kludge.py

4. build the extension:
scons -f MyOwnedType.SConstruct