.PHONY: sync cv publish serve

# Regenerate site content from the Obsidian vault, then rebuild the CV PDF.
sync:
	python3 scripts/sync_from_vault.py
	$(MAKE) cv

# Rebuild cv.pdf from the (generated) cv.html.
cv:
	./cv/build.sh

# Sync, then commit and push so GitHub Pages redeploys.
publish: sync
	git add -A
	git commit -m "sync: update site content from vault"
	git push origin master

# Local preview at http://localhost:4000
serve:
	bundle exec jekyll serve
