#!/usr/bin/env zsh

# Required for shunit2 to run correctly
CWD="${${(%):-%x}:A:h}"
setopt shwordsplit
SHUNIT_PARENT=$0

# Use system Spaceship or fallback to Spaceship Docker on CI
typeset -g SPACESHIP_ROOT="${SPACESHIP_ROOT:=/spaceship}"

# Mocked tool CLI
mocked_version="v1.0.0-mocked"
foobar() {
  echo "$mocked_version"
}

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

setUp() {
  # Enter the test directory
  cd $SHUNIT_TMPDIR
}

oneTimeSetUp() {
  export TERM="xterm-256color"

  source "$SPACESHIP_ROOT/spaceship.zsh"
  source "$(dirname $CWD)/spaceship-section.plugin.zsh"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(foobar)

  echo "Spaceship version: $(spaceship --version)"
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_ASYNC
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_incorrect_env() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "do not render system version" "$expected" "$actual"
}

test_mocked_version() {
  # Prepare the environment
  touch $SHUNIT_TMPDIR/test.foo

  local prefix="%{%B%}$SPACESHIP_FOOBAR_PREFIX%{%b%}"
  local content="%{%B%F{$SPACESHIP_FOOBAR_COLOR}%}$SPACESHIP_FOOBAR_SYMBOL$mocked_version%{%b%f%}"
  local suffix="%{%B%}$SPACESHIP_FOOBAR_SUFFIX%{%b%}"

  local expected="$prefix$content$suffix"
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "render mocked version" "$expected" "$actual"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/tests/shunit2/shunit2"
