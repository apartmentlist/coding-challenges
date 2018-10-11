# Coding challenge submission
# References:  
# https://filippo.io/making-system-calls-from-assembly-in-mac-os-x/
# http://cs.hadassah.ac.il/staff/martin/micro/slide09.pdf
# links above helped me write the assembly. I am familiar with x86 64-bit on linux using elf  
# However macs come with 32 out of the box I believe and didn't want to update nasm for this example

import subprocess

def oh_na_na_whats_my_name():
	subprocess.call(['nasm', '-f', 'macho', 'my_name.asm']) #assemble
	subprocess.call(['ld', '-o', 'my_name', 'my_name.o']) # link
	my_name_exec = subprocess.Popen('./my_name', shell=True, stdout=subprocess.PIPE) # run and pipe to stdout
	my_name_output = str(my_name_exec.stdout.read())
	print my_name_output.strip().decode('hex')
	

if __name__ == '__main__':
	oh_na_na_whats_my_name()