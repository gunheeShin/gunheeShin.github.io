.PHONY: cv serve

# Rebuild cv.pdf from cv/cv.html.
cv:
	./cv/build.sh

# Preview build (Docker) into _site; open it from the vault Homepage hub
serve:
	../../docker/build.sh
