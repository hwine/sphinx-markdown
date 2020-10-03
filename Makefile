REL_PATH := ../main

build: 
	make -C $(REL_PATH)/docs html
	find . -type d -name .git -prune -o -name Makefile -o -print0 | xargs -0 echo rm 
	git ls-files | grep -v Makefile$$ | xargs echo git rm
	cp -a $(REL_PATH)/docs/_build/html/ .

commit:
	git add -a
	git commit -m "Update docs"

preview:
	python3 -m http.server 8000
