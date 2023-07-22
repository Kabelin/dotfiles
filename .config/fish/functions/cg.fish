function cg --wraps='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' --description 'alias cfg=/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv; 
end
