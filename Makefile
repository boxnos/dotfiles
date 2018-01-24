CANDIDATES = $(wildcard .??*)
EXCLUSIONS = .git
DOTFILES = $(filter-out $(EXCLUSIONS), $(CANDIDATES))

all :

deploy :
	./setup/deploy.sh --deploy $(DOTFILES)

clean :
	@$(foreach val, $(DOTFILES), echo clean $(val); unlink $(HOME)/$(val);)
