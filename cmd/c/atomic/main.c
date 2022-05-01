#include <stdio.h>

typedef struct
{
    int counter;
} atomic_t;

static __always_inline void atomic_add(atomic_t *v, int i)
{
    __asm__ __volatile__("lock; addl %1,%0"
                         : "+m"(v->counter)
                         : "ir"(i));
}

static __always_inline void atomic_sub(atomic_t *v, int i)
{
    __asm__ __volatile__("lock; subl %1,%0"
                         : "+m"(v->counter)
                         : "ir"(i));
}

static __always_inline void atomic_inc(atomic_t *v)
{
    __asm__ __volatile__("lock; incl %0"
                         : "+m"(v->counter));
}

static __always_inline void atomic_dec(atomic_t *v)
{
    __asm__ __volatile__("lock; decl %0"
                         : "+m"(v->counter));
}

static __always_inline void atomic_read(atomic_t *v)
{
    __asm__ __volatile__("movl %0,%%eax"
                         :
                         : "m"(v->counter));
}