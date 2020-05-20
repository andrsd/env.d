export PATH=$PATH:/Applications/Paraview-5.4.1.app/Contents/MacOS

_paraview()
{
  local cmd="${1##*/}"
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]}
  local line=${COMP_LINE}
  local xpat='!*.e'
  local opts="--state= --version -V --data= --help"

  case "$cur" in
  --state=*)
    a=${cur#--state=}
    COMPREPLY=( $(compgen -f -X '!*.pvsm' -- $a ) )
    return 0
    ;;
  esac

  COMPREPLY=( $( compgen -W "$opts" -- $cur ; compgen -f -X '!*.e' -- $cur ) )
}

complete -F _paraview paraview
