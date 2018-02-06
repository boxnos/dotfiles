" tag:
syntax match	changelogTag	/\w\+:/
highlight link changelogTag	Comment

" changlogNumber match only date
syntax clear changelogNumber
syntax match changelogNumber	contained "\(\d\+[-/]\)\+\d\+"


