/* Open a dataset in Hotpot DSPM space */
int fd = open("/mnt/hotpot/dataset", O_CREAT|O_RDWR);

/* Obtain virtual address of dataset with traditional mmap() */
void *base= mmap(0,40960,PROT_WRITE,MAP_PRIVATE,fd,0);

/* Size of the application log */
int *log_size = base;
/* The application log */
int *log = base + sizeof(int);

/* Append an entry to the end of the log */
int new_data = 24;
log[*log_size] = new_data;
*log_size += 1;

/* Prepare memory region metadata for commit */
struct commit_area_struct {void *address; int length;};
struct commit_area_struct areas[2];
areas[0].address = log_size;
areas[0].length = sizeof(int);
areas[1].address = &log[*log_size];
areas[1].length = sizeof(int);

/* Commit the two data areas, each with two replicas */
commit(areas, 2);
