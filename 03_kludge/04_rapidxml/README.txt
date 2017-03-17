Follow the four steps of kludging:

1. run:
kludge discover RapidXML rapidxml-1.13/rapidxml.hpp

2. manually edit generated kludge files if required.
in this case - an an include to the tests file to the end of the RapidXML.kludge.py
include('RapidXML.tests.kludge.py')

3. run:
kludge generate RapidXML RapidXML.kludge.py

4. build the extension:
scons -f RapidXML.SConstruct