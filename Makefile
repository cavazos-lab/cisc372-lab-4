all: clean arraysum arraysum-omp1 arraysum-omp2 arraysum-omp3 arraysum-omp4 arraysum-omp5 arraysum-omp6 arraysum-omp7 arraysum-omp8

check: check-arraysum

clean: clean-arraysum

%.o: %.c
	gcc -c $< -o $@

arraysum: arraysum.o
	gcc arraysum.o -o arraysum

check-arraysum: arraysum
	./arraysum 100

clean-arraysum:
	rm -rf arraysum *.o arraysum-omp1 arraysum-omp2 arraysum-omp3 arraysum-omp4 arraysum-omp5 arraysum-omp6 arraysum-omp7 arraysum-omp8

arraysum-omp1:
	gcc -fopenmp arraysum-omp1.c -o arraysum-omp1
arraysum-omp2:
	gcc -fopenmp arraysum-omp2.c -o arraysum-omp2
arraysum-omp3:
	gcc -fopenmp arraysum-omp3.c -o arraysum-omp3
arraysum-omp4:
	gcc -fopenmp arraysum-omp4.c -o arraysum-omp4
arraysum-omp5:
	gcc -fopenmp arraysum-omp5.c -o arraysum-omp5
arraysum-omp6:
	gcc -fopenmp arraysum-omp6.c -o arraysum-omp6
arraysum-omp7:
	gcc -fopenmp arraysum-omp7.c -o arraysum-omp7
arraysum-omp8:
	gcc -fopenmp arraysum-omp8.c -o arraysum-omp8
