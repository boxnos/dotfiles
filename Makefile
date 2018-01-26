CANDIDATES = $(wildcard .??*)
EXCLUSIONS = .git
DOTFILES = $(filter-out $(EXCLUSIONS), $(CANDIDATES))

all :

deploy :
	./setup/deploy.sh --deploy $(DOTFILES)

clean :
	./setup/deploy.sh --clean $(DOTFILES)
