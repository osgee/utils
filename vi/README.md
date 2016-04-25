# vi

### Edit

	vi <file>


### File
	
	:x # exit and save changes
	:wq # exit and save anyway
	ZZ # exit and save changes
	:q! # exit and ignore changes
	:w file # write to file
	:r file # read file in after line
	:e file # edit file


### Insert

	
	i # insert before cursor
	I # insert after cursor
	a # append after cursor
	A # append after line
	o # open a new line after current line
	O # open a new line before current line
	r # replace one character
	R # replace many characters


### Exit Insert

	esc # return to command mode


### Motion

	h # move left
	j # move down
	k # move up
	l # move rignt
	w # move to next word
	b # move to the beginning of the word
	e # move to the end of the word
	( # move a sequence back
	) # move a sequence forward
	{ # move a paragraph back
	} # move a paragraph forward
	O # move to the beginning of the line
	$ # move to the end of the line
	1G # move to the first line of the file
	G # move to the last line of the file
	nG # move to nth line of the file
	:n # move to nth line of the file
	H # move to top of the screen
	M # move to middle of the screen
	L # move to botton of the screen


### Modify

#### Delete

	x # delete charactor to the right of cursor
	X # delete charactor to the left of cursor
	D # delete to the end of the line
	dd # delete current line
	:d # delete current line
	dl # delete the letter
	dw # delete the word

	
#### Yank

	yy # copy the current line
	:y # copy the current line
	yl # copy the curren letter
	yw # copy the current word, cursor must on first letter of the word

	
#### Change

	C # change to the end of the line
	cc # change the whole line
	cl # change the letter
	cw # change the word


#### Put

	p # put after the position or after the line
	P # put before the position or before the line

 
#### Undo
	
	u # undo last revision
	U # undo all revisions


#### Redo
	
	^C+r # redo last undo


#### Other
	
	~ # toggle up and lower case
	J # join lines
	. # repeat last text-changing command


#### Replace

        :s/pattern/string/flags # replace pattern with string according to flags
        g # flag-replace all occurrences of pattern
        c # flag-comfirm replaces
        & # repeat last :s command


### Search

	/text # search forward
	?text # search backward
	n # search next match
	N # search previous match


### Range

	:n,m # range lines n-m
	:. # current line
	:$ # last line
	:'c # marker c
	:% # all lines in file
	:g/pattern/ # all lines that contain pattern



