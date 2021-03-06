#!/usr/bin/env bash
source "$( dirname "${BASH_SOURCE[0]}" )/../harness.sh"

function creating_a_new_tmux_server() {
  local_tmux=$TMUX
  unset TMUX
  export TMUX
  run_mx red_sofa_project
  TMUX=$local_tmux

  expect_no_stderr
  expect_invocation_to_have_argument new-session -c "$MOCKS_DIR/red_sofa_project"
  expect_successful_run
}

tap_test 3 creating_a_new_tmux_server
