MPI_Init();
rnk =    MPI_Comm_rank();
sizeNodes =    MPI_Comm_size();
SLV = rnk;                // handy shortcuts, master is rank 0
Master = ~ SLV;            // slaves are all other
a=-1
if Master
// Declare a
a=42
end
b=MPI_Bcast(a, 0);
assert_checkequal(b,42);
MPI_Finalize();
