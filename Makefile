default:
	@echo "Help: "
	@echo "     make       : to show this help"
	@echo "     make build : to setup the package in current directory "
	@echo "     sudo make run   : to create the package in your python repo "
	@echo "     make test  : to test  the package  "
	@echo "     make clean : to clean up. "
	@echo " "
	@echo " Reference: https://python-packaging.readthedocs.io/en/latest/minimal.html "
	@echo " "

SETUP = ./funniest/setup.py
INIT  = ./funniest/funniest/__init__.py
BIN   = ./funniest/bin/funniest-joke

build: structure code
structure:
	mkdir -vp ./funniest/funniest
	mkdir -vp ./funniest/bin
	touch $(INIT) $(SETUP) $(BIN)

code: code1 code2 code3
code1:
	@echo "from setuptools import setup" > $(SETUP)
	@echo "" >> $(SETUP)
	@echo "setup(name='funniest'," >> $(SETUP)
	@echo "      version='0.1'," >> $(SETUP)
	@echo "      description='The funniest joke in the world'," >> $(SETUP)
	@echo "      url='http://github.com/storborg/funniest'," >> $(SETUP)
	@echo "      author='Flying Circus'," >> $(SETUP)
	@echo "      author_email='flyingcircus@example.com'," >> $(SETUP)
	@echo "      license='MIT'," >> $(SETUP)
	@echo "      packages=['funniest']," >> $(SETUP)
	@echo "      scripts=['bin/funniest-joke']," >> $(SETUP)
	@echo "      zip_safe=False)" >> $(SETUP)
code2:
	@echo "def joke(): " > $(INIT)
	@echo "    return (u'Wenn ist das Nunst\u00fcck git und Slotermeyer? Ja! ... ' " >> $(INIT)
	@echo "            u'Beiherhund das Oder die Flipperwaldt gersput.') " >> $(INIT)
code3:
	@echo "#!/usr/bin/env python " > $(BIN)
	@echo ""                       >> $(BIN)
	@echo "import funniest       " >> $(BIN)
	@echo "print funniest.joke() " >> $(BIN)




run:
	echo "Run with sudo"
	cd ./funniest && pip install .
test:
	echo "from funniest import joke " > test.py
	echo "print(joke() )" >> test.py
	python test.py
clean:
	rm -rf ./funniest
	rm -v test.py
