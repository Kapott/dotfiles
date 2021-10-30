alias b brew
alias g git
alias v vim

function l -d 'List files in long format'
	if command -q exa
		EXA_COLORS="da=36" exa -l --group-directories-first $argv
	else
		ls -lG $argv
	end
end

function ll -d 'List (all) files long format'
	if command -q exa
		EXA_COLORS="da=36" exa -al --group-directories-first $argv
	else
		ls -alG $argv
	end
end

function lsa -d 'List (all) files in short format'
	if command -q exa
		EXA_COLORS="da=36" exa -a --group-directories-first $argv
	else
		ls -aFG $argv
	end
end

function lsd -d 'List only directories'
	if command -q exa
		exa -D $argv
	else
		ls -l $argv | grep "^d" --color=never
	end
end

function dt -d 'ISO 8601 format for the current date'
	date "+%Y-%m-%d" $argv
end

function ip -d 'Get your current external ip'
	command -q curl && curl ifconfig.me
end

function upd -d 'Update package managers.'
	command -q brew && brew update
end

