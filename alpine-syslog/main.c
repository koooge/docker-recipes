#include <stdio.h>
#include <syslog.h>

int main(void) {
    syslog(LOG_INFO, "%s\n", "foo bar");
    return 0;
}
