### Debugging Code

#### GDB

-   [gdb - global thread
    dump](http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&ved=0CDYQFjAB&url=http%3A%2F%2Fsourceware.org%2Fgdb%2Fonlinedocs%2Fgdb%2FThreads.html&ei=pSehT_uNJcqj-gaq2aSjBw&usg=AFQjCNERBsV1ICcafttBSHv1XZKuRQlNHQ):

        threads apply all bt

-   gdb - pass arguments:

        set -- arg1 arg2 ...

-   [gdb - Print large
    strings](http://delicious.com/redirect?url=http%3A//sunsite.ualberta.ca/Documentation/Gnu/gdb-4.18/html_node/gdb_58.html):
    How to get gdb to always print the full string buffers:

        set print elements 10000

##### Help Commands
```
help command                    Get help on a certain command
apropos keyword                 Search help for a particular keyword
```

##### Starting and Quitting
```
gdb [-tui][-c core][exename]    *(Unix Command)* Start *gdb* on an
                                executable or standalone; specify "-tui" to
                                start the TUI GUI; specify "-c" with a corefile
                                name to see where a crash occured
run [arg1][arg2][...]           Run the currently loaded program with the
                                given command line arguments
kill                            Stop the program
Ctrl-d                          Exit gdb
Note: Ctrl-C does not exit from gdb, but halts the current
quit                            Exit the debugger
file exename                    Load an executable file by name
```


##### Breakpoints
```
 break sum                      Set breakpoint at the entry to function sum

```

##### Breakpoints and Watchpoints
```
break location                  Set a breakpoint at a location, line number,
                                or file (e.g. "main", "5", or "hello.c:23")
break *0x80483c3                Set breakpoint at address 0x80483c3
delete 1                        Delete breakpoint 1
disable 1                       Disable the breakpoint 1
(gdb numbers each breakpoint you create)
enable 1                        Enable breakpoint 1
delete                          Delete all breakpoints
watch expression                Break when a variable is written to
rwatch expression               Break when a variable is read from
awatch expression               Break when a variable is written to or read from
info break                      Display breakpoint and watchpoint information
                                and numbers
info watch                      Same as *info break*
clear location                  Clear a breakpoint from a location
delete numb                     Delete a breakpoint or watchpoint by number
```

##### Stepping and Running
```
next                            Run to the next line of this function
nexti                           Like stepi, but proceed
step                            Step into the function on this line, if possible
stepi                           Step a single assembly instruction
continue                        Keep running from here
CTRL-C                          Stop running, wherever you are
finish                          Run until the end of the current function
advance location                Advance to a location, line number, or file
                                (e.g. "somefunction", "5", or "hello.c:23")
jump location                   Just like continue, except jump to a particular
                                location first.
call sum(1, 2)                  Call sum(1,2) and print return value
through                         function calls without stopping
until 3                         Continue executing until program hits breakpoint 3
```

##### Examining and Modifying Variables
```
display expression              Display the value of a variable or expression
                                every step of the program - the expression must
                                make sense in the current scope
info display                    Show a list of expressions currently being
                                displayed and their numbers
undisplay numb                  Stop showing an expression identified by its
                                number (see *info display*)
print expression                Print the value of a variable or expression
printf formatstr expressionlist Do some formatted output with *printf()*
                                e.g. printf "i = %d, p = %s\n", i, p
set variable expression         Set a variable to value, e.g. set variable x=20
set (expression)                Works like *set variable*
```

##### Examining code
```
 disas                          Disassemble current function
 disas                          sum Disassemble function sum
 disas 0x80483b7                Disassemble function around 0x80483b7
 disas 0x80483b7 0x80483c7      Disassemble code within specified address range
 print /x $rip                  Print program counter in hex
 print /d $rip                  Print program counter in decimal
 print /t $rip                  Print program counter in binary
```

##### Examining data
```
 print /d $rax                  Print contents of %rax in decimal
 print /x $rax                  Print contents of %rax in hex
 print /t $rax                  Print contents of %rax in binary
 print /d (int)$rax             Print contents of %rax in decimal after
 sign-extending lower 32-bits.
 You need this to print 32-bit, negative
 numbers stored in the lower 32 bits of
 %rax. For example, if the lower 32-bits of
 %rax store 0xffffffff, you will see
 (gdb) print $rax
 $1 = 4294967295
 (gdb) print (int)$rax
 $2 = -1
 (gdb)
 print 0x100                    Print decimal representation of 0x100
 print /x 555                   Print hex representation of 555
 print /x ($rsp+8)              Print (contents of %rsp) + 8 in hex
 print *(int *) 0xbffff890      Print integer at address 0xbffff890
 print *(int *) ($rsp+8)        Print integer at address %rsp + 8
 print (char *) 0xbfff890       Examine a string stored at 0xbffff890
 x/w 0xbffff890                 Examine (4-byte) word starting at address 0xbffff890
 x/w $rsp                       Examine (4-byte) word starting at address in $rsp
 x/wd $rsp                      Examine (4-byte) word starting at address in $rsp. Print in decimal
 x/2w $rsp                      Examine two (4-byte) words starting at address in $rsp
 x/2wd $rsp                     Examine two (4-byte) words starting at address in $rsp. Print in decimal
 x/g $rsp                       Examine (8-byte) word starting at address in $rsp.
 x/gd $rsp                      Examine (8-byte) word starting at address in $rsp. Print in decimal
 x/a $rsp                       Examine address in $rsp. Print as offset from previous global symbol.
 x/s 0xbffff890                 Examine a string stored at 0xbffff890
 x/20b sum                      Examine first 20 opcode bytes of function sum
 x/10i sum                      Examine first 10 instructions of function sum
 (Note: the format string for the ‘x’ command has the general form
 x/[NUM][SIZE][FORMAT] where
 NUM = number of objects to display
 SIZE = size of each object (b=byte, h=half-word, w=word,
 g=giant (quad-word))
 FORMAT = how to display each object (d=decimal, x=hex, o=octal, etc.)
 If you don’t specify SIZE or FORMAT, either a default value, or the last
 value you specified in a previous ‘print’ or ‘x’ command is used.
 )
 ```

##### Useful information
```
 backtrace                      Print the current address and stack backtrace
 where                          Print the current address and stack backtrace
 info program                   Print current status of the program)
 info functions                 Print functions in program
 info stack                     Print backtrace of the stack)
 info frame                     Print information about the current stack frame
 info registers                 Print registers and their contents
 info breakpoints               Print status of user-settable breakpoints
 display /FMT EXPR              Print expression EXPR using format FMT every time GDB stops
 undisplay                      Turn off display mode
 help                           Get information about gdb
 ```

##### Window Commands
```
info win                        Shows current window info
focus winname                   Set focus to a particular window by name
                                ("SRC", "CMD", "ASM", or "REG") or by
                                position ("next" or "prev")
fs                              Alias for *focus*
layout type                     Set the window layout ("src", "asm", "split",
                                or "reg")
tui reg type                    Set the register window layout ("general",
                                "float", "system", or "next")
winheight val                   value or a relative value prefaced with "+"
                                or "-"
wh                              Alias for winheight
set disassembly-flavor flavor   Set the look-and-feel of the disassembly.
                                On Intel machines, valid flavors are *intel*
                                and *att*
```

##### Misc Commands
```
RETURN                          Hit RETURN to repeat the last command
backtrace                       Show the current stack
bt                              Alias for *backtrace*
attach pid                      Attach to an already-running process by its PID
info registers                  Dump integer registers to screen
info all-registers              Dump all registers to screen
```

#### Memory Leaks

-   Glib - mtrace(): Enable tracing by calling mtrace() right on startup
    and set environment variable

        export MALLOC_TRACE=alloc.log

    and analyze the result log with

        mtrace [<executable>] alloc.log

-   Glib - Slice Allocation Checking

        export G_SLICE=debug-blocks

-   Valgrind

        valgrind --leak-check=yes <executable> [ [...]]

-   [JVM - Verbose
    GC](http://javaeesupportpatterns.blogspot.de/2011/10/verbosegc-output-tutorial-java-7.html):

        -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -Xloggc:/gc.log

-   [JVM -
    jstat](http://docs.oracle.com/javase/6/docs/technotes/tools/share/jstat.html):

