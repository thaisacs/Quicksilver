DATASET=exp-results
rm -rf $DATASET
mkdir $DATASET

sudo perf stat -o $DATASET/perf-asc-qs.out ./qs --nSteps 100
/usr/bin/time -o $DATASET/time-asc-qs.out -v ./qs --nSteps 100
ltrace -o $DATASET/mpi-asc-qs.out ./qs --nSteps 100

cd $DATASET
cat mpi-asc-lammps.out | grep "MPI" > mpi2-asc-lammps.out
rm mpi-asc-lammps.out
mv mpi2-asc-lammps.out mpi-asc-lammps.out

#mpirun -n 2 ./lmp -var t 300 -echo screen -in lj/in.lj
