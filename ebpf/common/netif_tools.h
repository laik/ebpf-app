#ifndef __NETIF_TOOLS_H
#define __NETIF_TOOLS_H

#include <stdio.h>
#include <string.h>

char *inet_ntoa(unsigned long);

// char str[30];
// int main(int argc, char **argv)
// {
//     unsigned long inaddr = 3232235777;
//     printf("%s\n", my_inet_ntoa(inaddr));
//     return 0;
// }

char *inet_ntoa(unsigned long inaddr)
{
    int a[4];
    char b[20], c[15], d[10], e[5], *str = NULL;
    a[0] = ((inaddr & 0xff000000) >> 24);
    a[1] = ((inaddr & 0x00ff0000) >> 16);
    a[2] = ((inaddr & 0x0000ff00) >> 8);
    a[3] = ((inaddr & 0x000000ff) >> 0);

    sprintf(b, "%d", a[0]);
    strcat(b, ".");

    sprintf(c, "%d", a[1]);
    strcat(c, ".");

    sprintf(d, "%d", a[2]);
    strcat(d, ".");

    sprintf(e, "%d", a[3]);
    strcat(str, strcat(b, strcat(c, strcat(d, e))));

    return str;
}

#endif