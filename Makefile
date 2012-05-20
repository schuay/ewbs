archive=0203440_project1.zip

check:
	./test.sh

package: clean
	zip $(archive) *.{dl,hyp,obs} --exclude tests_*

clean:
	rm -f $(archive)
