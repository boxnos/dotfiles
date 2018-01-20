CANDIDATES = $(wildcard .??*)
EXCLUSIONS = .git
DOTFILES = $(filter-out $(EXCLUSIONS), $(CANDIDATES))

all :

deploy :
	@$(foreach val, $(DOTFILES), echo deploy $(val); ln -s $(abspath $(val)) $(HOME)/$(val);)	

clean :
	@$(foreach val, $(DOTFILES), echo clean $(val); rm $(HOME)/$(val);)	
