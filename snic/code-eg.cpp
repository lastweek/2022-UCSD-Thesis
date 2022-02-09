int fd = open("/mnt/mmapfile", O_CREAT|O_RDWR);            // open a file in mounted SCRM region
void *base = mmap(NULL, 40960, PROT_WRITE, 
                  MAP_SHARED, fd, 0);                      // mmap a 40KB area in the file
			
unsigned long *access_count_p = base;                      // access count of the log
unsigned long *log_size_p = base + sizeof(unsigned long);  // size of the log
int *log = base + 2*sizeof(unsigned long);                 // the log

*access_count_p = *access_count_p + 1;                     // memory load and store
msync(access_count_p, sizeof(unsigned long), MS_SYNC);     // call conventional msync

int beautiful_num = 24;
unsigned long curr_log_pos = *log_size_p;                  // memory load and store
log[curr_log_pos] = beautiful_num;                          
*log_size_p = *log_size_p + 1;
struct msync_input { void *address; int length; };
struct msync_input input[2];
input[0].address = &(log[curr_log_pos]);                           
input[0].length = sizeof(int);
input[1].address = log_size_p;
input[1].length = sizeof(unsigned long);
msync(input, 2, MS_SCRM);                   // call SCRM atomic API to commit the log append
