MPI_Init();
rnk =    MPI_Comm_rank();
sizeNodes =    MPI_Comm_size();
SLV = rnk;                // handy shortcuts, master is rank 0
Master = ~ SLV;            // slaves are all other
tag=0;
if Master
// The master node
for slaveId = 1:sizeNodes-1
// Send data to the slaves
value = rand(100,100) + rand(100,100) * %i;
MPI_Send(value, slaveId);
end
for slaveId = 1:sizeNodes-1
valueBack=MPI_Recv(slaveId, tag);
// Check that the slaves gaves us what we expected
assert_checkequal(valueBack,value + 1);
end
else
// The slaves
rankSource=0;
// Receive the information from the master
value=MPI_Recv(rankSource);
// Increment all the values by one
value=value+1;
// Send back to the master
MPI_Send(value,0);
end
MPI_Finalize();
