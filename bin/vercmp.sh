#!/bin/bash
# Copyright (c) 2012 Yu-Jie Lin
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

VER_SPLIT_SED='s/\./ /g;s/\([[:digit:]]\)\([^[:digit:] ]\)/\1 \2/g;s/\([^[:digit:] ]\)\([[:digit:]]\)/\1 \2/g'

# Compare with one element of version components
_ver_cmp_1() {
  [[ "$1" = "$2" ]] && return 0
  if [[ -z "${1//[[:digit:]]/}" ]] && [[ -z "${2//[[:digit:]]/}" ]]; then
    # Both $1 and $2 are numbers
    # Using arithmetic comparison
    (( $1 > $2 )) && return 1
    (( $1 < $2 )) && return 2
  else
    # Either or both are not numbers, containing non-digit characters
    # Using string comparison
    [[ "$1" > "$2" ]] && return 1
    [[ "$1" < "$2" ]] && return 2
  fi
  # This should not be happening
  exit 1
}

vercmp() {
  local A B i result
  A=($(sed "$VER_SPLIT_SED"  <<< "$1"))
  B=($(sed "$VER_SPLIT_SED"  <<< "$2"))
  i=0
  while (( i < ${#A[@]} )) && (( i < ${#B[@]})); do
    _ver_cmp_1 "${A[i]}" "${B[i]}"
    result=$?
    [[ $result =~ [12] ]] && return $result
    let i++
  done
  # Which has more, then it is the newer version
  _ver_cmp_1 "${#A[i]}" "${#B[i]}"
  return $?
}
