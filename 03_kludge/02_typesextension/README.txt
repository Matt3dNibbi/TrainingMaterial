Follow the four steps of kludging:

1. run:
kludge discover TypesExtension MyVector.h

2. manually edit generated kludge files if required, add patches etc

3. run:
kludge generate TypesExtension TypesExtension.kludge.py

4. build the extension:
scons -f TypesExtension.SConstruct