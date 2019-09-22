# Defined in - @ line 1
function filemtime --description 'output timestamp of given file modification in a format for embedding in filename'
	date --date=@(stat --printf='%Y' $argv[1]) +%Y-%m-%d--%H-%M-%S
end
