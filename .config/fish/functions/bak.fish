# Defined in /tmp/fish.LrkZkK/bak.fish @ line 2
function bak --description 'Create a backup of the file with timestamp based on modtime' --argument file
  set -l path (dirname $file)
  set -l fn (basename $file)
  set -l fnparts (string split --right --max=1 '.' $fn)
  set -l base $fnparts[1]
  set -l ext $fnparts[2]
  set -l bkfile $path/$base.(filemtime $file).$ext

  echo "$file +> $bkfile"
  cp -a $file $bkfile
end
