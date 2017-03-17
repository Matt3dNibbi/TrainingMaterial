Follow the four steps of kludging:

1. run:
kludge discover SimpleExtension SimpleExtension.h

2. manually edit generated kludge files if required, add patches etc

3. run:
kludge generate SimpleExtension SimpleExtension.kludge.py

4. build the extension:
scons -f SimpleExtension.SConstruct