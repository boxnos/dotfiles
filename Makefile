CANDIDATES = $(wildcard .??*)
EXCLUSIONS = .git
DOTFILES = $(filter-out $(EXCLUSIONS), $(CANDIDATES))

all :

deploy :
	@$(foreach val, $(DOTFILES), echo deploy $(val); ln -sn $(abspath $(val)) $(HOME)/$(val);)	

clean :
	@$(foreach val, $(DOTFILES), echo clean $(val); rm $(HOME)/$(val);)	
