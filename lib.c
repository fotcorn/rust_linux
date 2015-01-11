#include <linux/module.h>

int my_printk(const char* str) {
    return printk(str);
}

