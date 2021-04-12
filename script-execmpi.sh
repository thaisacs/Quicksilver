DATASET=exp-results
rm -rf $DATASET
mkdir $DATASET

app=./src/qs --nSteps 100

perf stat -o $DATASET/perf-asc-qs.out $app
/usr/bin/time -o $DATASET/time-asc-qs.out -v $app

#ltrace -o $DATASET/mpi-asc-qs.out ./qs --nSteps 100
#cd $DATASET
#cat mpi-asc-lammps.out | grep "MPI" > mpi2-asc-lammps.out
#rm mpi-asc-lammps.out
#mv mpi2-asc-lammps.out mpi-asc-lammps.out
