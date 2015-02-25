#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <omp.h>

long * createArray(int n) {
  return malloc(n * sizeof(long));
}

long * initArray(int n) {
  long * res = createArray(n);

  int i;
  for (i = 0; i < n; i++)
    res[i] = (long)(i+1);

  return res;
}

long arraysum(int n, long * a) {
  long sum=0.0;
  long tempsum[100]; // assume number of threads < 100
  int numThreads;
  int count = 0; 
  int i;
  int nid;
#pragma omp parallel private(nid,i)
  {
    numThreads = omp_get_num_threads();
    nid = omp_get_thread_num();
    for (i=nid*n/numThreads, tempsum[nid]=0; i<(nid+1)*n/numThreads; i++) 
    //for (i=nid, tempsum[nid]=0; i<n; i+=numThreads) 
        tempsum[nid] += a[i];
  }
  for (i=0; i<numThreads;i++) sum+=tempsum[i]; 

  return sum;
}

int main(int argc, char ** argv) {
  assert(argc == 2);

  int n = atoi(argv[1]);
  assert(n>0 && n<=21474843647);

  printf ("Initializing an array of size %d with numbers 1 to %d\n", n);
  long * a = initArray(n);

  printf ("Summing up all the elements of the array\n", n);
  printf ("The sum is: %ld\n", arraysum(n, a));

  return 0;
}

