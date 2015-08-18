DATE = $(shell date +%Y-%m-%d)
DAILYFILE = $(DATE)-$(DATE).md
file = tmp
OTHERFILE = $(DATE)-$(file).md

all: build

build:
	jekyll build

serve:
	jekyll serve -w

new:    FILE="$(DAILYFILE)"
new:
	if [ -f _posts/$(FILE) ]; then \
	echo "$(FILE) exists"; \
	else \
	echo "Generating _posts/$(FILE)"; \
	cp _posts/daily_template.md _posts/$(FILE); \
	git add _posts/$(FILE); \
	fi; 
	rm _posts/today.md 2>/dev/null; \
	ln -s $(PWD)/_posts/$(FILE) _posts/today.md; \

today: new

lit:	FILE="$(OTHERFILE)"
lit:
	if [ -f _posts/$(FILE) ]; then \
	echo "$(FILE) exists"; \
	else \
	echo "Generating _posts/$(FILE)"; \
	cp _posts/lit_template.md _posts/$(FILE); \
	git add _posts/$(FILE); \
	fi; 

clean:
	rm -r _site

.PHONY: all clean build new
