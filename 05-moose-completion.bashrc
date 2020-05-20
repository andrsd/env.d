# Auto-complete MOOSE-based binaries

_moose_bin()
{
    local cmd="${1##*/}"
    local cur=${COMP_WORDS[COMP_CWORD]}
    local prev=${COMP_WORDS[COMP_CWORD-1]}
    local line=${COMP_LINE}
    local xpat='!*.i'
    local opts="--allow-test-objects --type --check-input --color --definition -v --version \
      --distributed-mesh --dump --error --error-deprecated -o --error-override -e --error-unused \
      --half-transient -h --help -i --json --keep-cout --list-constructed-objects --mesh-only \
      --minimal --n-threads --no-color --no-timing --no-trap-fpe --recover --recoversuffix \
      --redirect-stdout -r --redirect-stdout --registry-hit --show-controls --show-input \
      --show-outputs --split-mesh --start-in-debugger --stop-for-debugger --syntax -t --timing \
      --trap-fpe --use-split -w --warn-unused --yaml"
    local color_opts="auto on off"

    case "$prev" in
    *-i*)
      xpat='!*.i'
      COMPREPLY=($( compgen -f -X "$xpat" -- "${cur}"))
      ;;
    --color*)
      COMPREPLY=( $( compgen -W "$color_opts" -- $cur ) )
      return 0
      ;;
    esac

    COMPREPLY=( $( compgen -W "$opts" -- $cur ) )
}

APPS=( moose_test )
APPS_OPT=( "${APPS[@]/%/-opt}" )
APPS_DBG=( "${APPS[@]/%/-dbg}" )
APPS_OPROF=( "${APPS[@]/%/-oprof}" )

complete -d -X '.[^./]*' -F _moose_bin ${APPS_DBG[@]}
complete -d -X '.[^./]*' -F _moose_bin ${APPS_OPT[@]}
complete -d -X '.[^./]*' -F _moose_bin ${APPS_OPROF[@]}


# Auto-complete `run_tests`

_run_tests()
{
  local cmd="${1##*/}"
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]}
  local line=${COMP_LINE}
  local opts="--opt --dbg --devel --oprof --pro --ignore -j --jobs -e -c --no-color --heavy \
    --all-tests -g --group --not_group --dbfile -l --load-average -t --timing -s --scale -i \
    --libmesh_dir --skip-config-checks --parallel -p --n-threads --recover --recoversuffix \
    --valgrind --valgrind-heavy --valgrind-max-fails --max-fails --re --failed-tests \
    --check-input --no-check-input --spec-file -d --pedantic-check --parallel-mesh \
    --distributed-mesh --error --error-unused --error-deprecated --cli-args \
    --dry-run --use-subdir-exe -v --verbose -q --quiet --no-report --show-directory -o \
    --output-dir -f --file --sep-files-ok -a --sep-files-fail --testharness-unittest --yaml \
    --dump --testharness-unittest --no-trimmed-output --no-trimmed-output-on-error"

  COMPREPLY=( $( compgen -W "$opts" -- $cur ) )
}
complete -F _run_tests run_tests


# Auto-complete `moosedocs.py`

_moose_docs()
{
  local cmd="${1##*/}"
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]}
  local line=${COMP_LINE}

  local opts="-h --help --verbose -v check build"
  local check_opts="--dump"
  local build_opts="--serve --check --error"

  case "$prev" in
  *check*)
    COMPREPLY=( $( compgen -W "$check_opts" -- $cur ) )
    return 0
    ;;

  *build*)
    COMPREPLY=( $( compgen -W "$build_opts" -- $cur ) )
    return 0
    ;;
  esac

  COMPREPLY=( $( compgen -W "$opts" -- $cur ) )
}

complete -F _moose_docs moosedocs.py


# Auto-complete `build_coverage.py`

_build_coverage()
{
  local cmd="${1##*/}"
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]}
  local line=${COMP_LINE}

  local opts="-h --help --generate-html --addtime --overwrite --cleanup --dryrun \
    --verify-coverage --title --outfile --mode --application --add-tracefile --html-location \
    --sync-location --coverage-percentage --cov-tool"
  local mode_opts="generate initialize combine sync"

  case "$prev" in
  *mode*)
    COMPREPLY=( $( compgen -W "$mode_opts" -- $cur ) )
    return 0
    ;;
  esac

  COMPREPLY=( $( compgen -W "$opts" -- $cur ) )
}

complete -F _build_coverage build_coverage.py
