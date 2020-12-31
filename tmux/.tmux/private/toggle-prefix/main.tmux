#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BINDINGS_DIR="$CURRENT_DIR/bindings"

set_bindings() {
    tmux bind-key "T" run-shell "$BINDINGS_DIR/toggle_prefix"
    tmux bind-key "t" run-shell "$BINDINGS_DIR/toggle_prefix"
}

main(){
    set_bindings
}

main
