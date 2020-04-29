all: README.md

README.md:
	echo "# COURSERA UNIX WORKBENCH ASSIGNMENT" > README.md
	echo "" >> README.md
	date "+DATE: %Y-%m-%d TIME: %H:%M:%S" >> README.md
	echo "" >> README.md
	echo "Count of lines in guessinggame.sh: `wc -l guessinggame.sh | egrep -o "[0-9]+"` " >> README.md

clean:
	rm -f README.md

