REL_PATH := ../main

build: 
	make -C $(REL_PATH)/docs html
	@# get rid of everything known to git except Makefile
	git ls-files | grep -v Makefile$$ | xargs git rm
	@# get rid of everything not known to git
	git clean --force -d
	@# bring over the new material
	cp -a $(REL_PATH)/docs/_build/html/ .

commit:
	git add --all
	git commit -m "Update docs"

preview:
	python3 -m http.server 8000
