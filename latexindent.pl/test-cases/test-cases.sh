#!/bin/bash

# A little script to help me run through test cases
# Sample usage
#   ./test-cases.sh 
#   ./test-cases.sh -s              # silent mode, don't echo the latexindent command
#   ./test-cases.sh -n              # play a noise at the end of each batch of test cases
#   ./test-cases.sh -c              # show the counter within loops
#   ./test-cases.sh -b              # do the benchmark test cases
#   ./test-cases.sh -f              # do the file extension test cases
#   ./test-cases.sh -a              # do *all* test cases (toggles bench mark and file extension switches)
#   ./test-cases.sh -o <INTEGER>    # only do the loops for <INTEGER>

function checkgitdiff
{
    git diff --quiet
    result=$? && [[ result -gt 0  ]]&&   echo "git diff has differences, something has changed" && exit
}

silentMode=0
silentModeFlag=''
showCounterFlag=''
noisyModeFlag=''
benchmarkMode=0
fileExtensionMode=0
# check flags, and change defaults appropriately
while getopts "abscfo:n" OPTION
do
 case $OPTION in 
  s)    
   echo "Silent mode on..."
   silentModeFlag='-s'
   silentMode=1
   ;;
  a)
    # all mode
    benchmarkMode=1
    fileExtensionMode=1
    ;;
  b)
    # bench mark mode
    benchmarkMode=1
    ;;
  f)
    # file extension test mode
    fileExtensionMode=1
    ;;
  c)    
   echo "Show counter mode active!"
   showCounterFlag='-c'
   ;;
  o)
    # only do this one in the loop
    loopminFlag="-o $OPTARG"
   ;;
  n)
    # only do this one in the loop
    noisyModeFlag="-n"
    noisyMode=1
   ;;
  ?)    printf "Usage: %s: [-s]  args\n" $(basename $0) >&2
        exit 2
        ;;
 # end case
 esac 
done

# set verbose mode, 
# see http://stackoverflow.com/questions/2853803/in-a-shell-script-echo-shell-commands-as-they-are-executed

checkgitdiff

# environment objects
cd environments
[[ $silentMode == 1 ]] && echo "./environments/environments-test-cases.sh"
./environments-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# ifelsefi objects
cd ../ifelsefi
[[ $silentMode == 1 ]] && echo "./ifelsefi/ifelsefi-test-cases.sh"
./ifelsefi-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# optional arguments in environments
cd ../opt-args
[[ $silentMode == 1 ]] && echo "./opt-args/opt-args-test-cases.sh"
./opt-args-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# mandatory arguments in environments
cd ../mand-args
[[ $silentMode == 1 ]] && echo "./mand-args/mand-args-test-cases.sh"
./mand-args-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# mixture of optional and mandatory arguments
cd ../opt-and-mand-args/
[[ $silentMode == 1 ]] && echo "./opt-and-mand-args/opt-and-mand-args-test-cases.sh"
./opt-mand-args-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# items
cd ../items/
[[ $silentMode == 1 ]] && echo "./items/items-test-cases.sh"
./items-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# commands
cd ../commands/
[[ $silentMode == 1 ]] && echo "./commands/commands-test-cases.sh"
./commands-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# key equals value braces
cd ../keyEqualsValueBraces/
[[ $silentMode == 1 ]] && echo "./keyEqualsValueBraces/key-equals-values-test-cases.sh"
./key-equals-values-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# file extension
cd ../fileextensions/
[[ $fileExtensionMode == 1 ]] && [[ $silentMode == 1 ]] && echo "./fileextensions/file-extension-test-cases.sh"
[[ $fileExtensionMode == 1 ]] && ./file-extension-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# token checks
cd ../tokenChecks/
[[ $silentMode == 1 ]] && echo "./tokenChecks/token-checks.sh"
./token-checks.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# cruft directory
cd ../cruftdirectory/
[[ $silentMode == 1 ]] && echo "./cruftdirectory/cruft-directory-test-cases.sh"
./cruft-directory-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# STDIN
cd ../STDIN/
[[ $silentMode == 1 ]] && echo "./STDIN/stdin-test-cases.sh"
./stdin-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# named grouping braces
cd ../namedGroupingBracesBrackets
[[ $silentMode == 1 ]] && echo "./namedGroupingBracesBrackets/named-grouping-test-cases.sh"
./named-grouping-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# unnamed grouping braces
cd ../unnamed-braces && echo "./unnamed-braces/un-named-grouping-braces.sh"
./un-named-grouping-braces.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# specials
cd ../specials
[[ $silentMode == 1 ]] && echo "./specials/specials-test-cases.sh"
./specials-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# headings
cd ../headings
[[ $silentMode == 1 ]] && echo "./headings/headings-test-cases.sh"
./headings-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# filecontents
cd ../filecontents
[[ $silentMode == 1 ]] && echo "./filecontents/filecontents-test-cases.sh"
./filecontents-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# alignment
cd ../alignment
[[ $silentMode == 1 ]] && echo "./alignment/alignment-test-cases.sh"
./alignment-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# long line text wrapping
cd ../textWrap-removeParaLineBreaks
[[ $silentMode == 1 ]] && echo "./textWrap-removeParaLineBreaks/text-wrap-remove-PLB.sh"
./text-wrap-remove-PLB.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# texexchange
cd ../texexchange
[[ $silentMode == 1 ]] && echo "./texexchange/texexchange-test-cases.sh"
./texexchange-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# whitespace
cd ../horizontalWhiteSpace
[[ $silentMode == 1 ]] && echo "./horizontalWhiteSpace/whitespace-test-cases.sh"
./whitespace-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# one sentence per line
cd ../oneSentencePerLine
[[ $silentMode == 1 ]] && echo "./oneSentencePerLine/one-sentence-per-line.sh"
./one-sentence-per-line.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# benchmark mode, if appropriate
cd ../benchmarks
[[ $benchmarkMode == 1 ]] && ./benchmarks.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# verbatim test cases
cd ../verbatim
[[ $silentMode == 1 ]] && echo "./verbatim-test-cases.sh"
./verbatim-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# fine-tuning test cases
cd ../fine-tuning
[[ $silentMode == 1 ]] && echo "./fine-tuning-test-cases.sh"
./fine-tuning-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# replacement test cases
cd ../replacements
[[ $silentMode == 1 ]] && echo "./replacement-test-cases.sh"
./replacement-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# poly-switch-blank-line test cases (poly-switches = 4)
cd ../poly-switch-blank-line
[[ $silentMode == 1 ]] && echo "./poly-switch-blank-line-test-cases.sh"
./poly-switch-blank-line-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# check switch test cases
cd ../check-switch-tests
[[ $silentMode == 1 ]] && echo "./check-switch-test-cases.sh"
./check-switch-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# line switch test cases
cd ../line-switch-test-cases
[[ $silentMode == 1 ]] && echo "./line-switch-test-cases.sh"
./line-switch-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# documentation demonstrations
cd ../../documentation/demonstrations
[[ $silentMode == 1 ]] && echo "./documentation-test-cases.sh"
./documentation-test-cases.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag
checkgitdiff

# documentation
cd ../
[[ $silentMode == 1 ]] && echo "./latex-indent.sh"
./latex-indent.sh $silentModeFlag $showCounterFlag $loopminFlag $noisyModeFlag

# play sounds
for i in {1..5}
do 
  [[ $noisyMode == 1 ]] && paplay /usr/share/sounds/freedesktop/stereo/complete.oga
done

exit 1
