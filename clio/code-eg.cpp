/* Alloc one remote page. Define a remote lock */
#define PAGE_SIZE (1<<22)
void *remote_addr = ralloc(PAGE_SIZE);
ras_lock lock;

/* Acquire lock to enter critical section.
   Do two AYSNC writes then poll completion. */
void thread1(void *) {
 rlock(lock);
 e[0]=rwrite(remote_addr, local_wbuf1,len, ASYNC);
 e[1]=rwrite(remote_addr+len, local_wbuf2,len, ASYNC);
 runlock(lock);
 rpoll(e, 2);
}

/* Synchronously read from remote */
void thread2(void *) {
 rlock(lock); 
 rread(remote_addr, local_rbuf, len, SYNC);
 runlock(lock); 
}
