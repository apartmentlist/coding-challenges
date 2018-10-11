SECTION .data
msg db '56617461736861205768697465', 10  	;string to be printed
msg_len equ $ - msg     					;length of the string

SECTION .text

global start    
	
start:
   push ebp             	;establish stack frame, push base pointer (ebp) 
   							;onto stack to save it

   mov ebp, esp	         	;copy stack pointer esp to ebp so ebp points to stack frame 
   push	dword msg_len   	;push msg length to stack
   push dword msg     	    ;push pointer to msg onto stack
   push dword 1       	    ;file descriptor (stdout)
   mov eax, 4  		        ;system call number (sys_write)
   sub esp, 4               ;space allocated on stack for msg var  
   int 0x80          	    ;call kernel
   add esp, 16             	;pop stack 4 times (look to prev pushes above)
  		
   
   push dword 0             ;exit code
   mov	eax, 1              ;mac0S termination code 
   sub esp, 4               ;space allocated exit code onto stack
   int 0x80          	
 