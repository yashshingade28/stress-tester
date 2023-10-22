# compiling all the relevant cpp files for stress testing .
g++ wrong.cpp -DONLINE_JUDGE -o wrong.exe
g++ correct.cpp -DONLINE_JUDGE -o correct.exe
g++ gen.cpp -o gen.exe

# infinite loop till we get the testcase which our code fails on. 
for((i = 1 ; ; i++))
do 
    ./gen.exe > testcase.txt
    ./wrong.exe < testcase.txt > WA.txt
    ./correct.exe < testcase.txt > CA.txt
	diff -B -w -i WA.txt CA.txt > /dev/null || break
    echo "Passed test : "$i
done

# printing the failing testcase , our answer , and correct answer .
# used echo -e so that i can use\n to insert a newline .
# could've also used printf in place of echo -e .
echo -e "\nTESTCASE:"
cat testcase.txt
echo -e "\nYour answer:"
cat WA.txt
echo -e "\nCorrect answer:"
cat CA.txt 
echo -e ""

# Note : 
# ./{executable file}.exe  < {input_file_name}.txt 1> {output_file_name}.txt 2> {error_file_name}.txt   OR
# ./{executable file}.exe  < {input_file_name}.txt  > {output_file_name}.txt 2> {error_file_name}.txt

# these two notation redirect
# stdin to {input_file_name}.txt
# stdout to {output_file_name}.txt
# stderr to {error_file_name}.txt


# flags used in diff :=
# -B : ignores blank lines 
# -Z : ignores white spaces at the end of lines 
# -i : ignores the case of contents of file 
# -w : ignores white spaces (most of the online judge don't check white spaces)
# but some of them do so in that case it is better to use -Z flag