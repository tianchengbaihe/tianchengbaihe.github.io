#!/bin/bash

# To Run this , you need to get a shunit2

function len() {
	STR="$1"
	echo ${#STR}
}

function charAt() {
	echo ${1:$2:1}
}

function substr() {
	echo ${1:$2:$3}
}
# not strict, since it depends on the sed
function replaceAll() {
	echo $1 | sed "s/$2/$3/g"
}

function trim() {
	echo $1
}

function concat() {
	echo $"$1$2"
}

function split() {
	echo ${1//$2/ }
}

function toLower() {
	tr "A-Z" "a-z" <<< "$1"
}


# I use this because on mac, expr doesn't work(yosemite)
function indexOfMac() {
	local i
	LEN=${#2}
	for (( i = 0; i < ${#1}; i++ )); do
		if [[ "${1:i:LEN}" == "$2" ]]; then
			echo $i
			return 0
		fi
	done
	echo -1 
	return 0
}
function indexOf() {
	STR="$1"
	SEARCH="$2"
	INDEX=`index "$STR" "$SEARCH"`
	echo $INDEX
}



# test functions
function test_len() {
	assertEquals $(len "abcd") "4"
	assertEquals $(len "") "0"
	assertEquals $(len "a b c d") "7"
}

function test_indexOf() {
	assertEquals $(indexOfMac "abcd" "a") "0"
	assertEquals $(indexOfMac "abcd" "bcd") "1"
	assertEquals $(indexOfMac "abcd" "cde") "-1"
}
function test_charAt() {
	assertEquals $(charAt "abcd" "0") "a"
	assertEquals $(charAt "abcd" "3") "d"
	assertEquals "$(charAt abcd 5)" ""
}
function test_substr() {
	assertEquals $(substr "abcd" 0 2) "ab"
	assertEquals $(substr "abcdefg" 3 3) "def"
	assertEquals $(substr "ab" 1 3) "b"
	assertEquals "$(substr ab 2 3)" ""
}

function test_replaceAll() {
	assertEquals $(replaceAll "aaaa" "aa" "b") "bb"
	assertEquals $(replaceAll "aaaa" "b" "") "aaaa"
	assertEquals $(replaceAll "abcd" "." "a") "aaaa"
	assertEquals $(replaceAll "a.b.c" "\\." ",") "a,b,c"
	assertEquals $(replaceAll "a b c" "[ ]" ",") "a,b,c"
	assertEquals "$(replaceAll "aaaa" "" "b")" "" # should not be empty
}

function test_trim() {
	assertEquals "$(trim "a b c")" "a b c"
	assertEquals "$(trim "a b c ")" "a b c"
	assertEquals "$(trim " a b c ")" "a b c"
	# It is a pity that it will compress multiple blanks
	assertNotEquals "$(trim " a  b  c ")" "a  b  c" 
}


function test_concat() {
	assertEquals "$(concat "a " "b c")" "a b c"
	assertEquals "$(concat " a" " b c ")" " a b c "
}

function test_split() {
	ARR=(`split "a,b,c,d" ","`)
	assertEquals "${#ARR[@]}" "4"
}

function test_toLower() {
	assertEquals $(toLower "ABCDefg..") "abcdefg.."
}



source "shunit2"