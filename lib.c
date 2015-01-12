#include <linux/module.h>
MODULE_LICENSE("Dual BSD/GPL");


int my_printk(const char* str) {
    return printk(KERN_ALERT "%s", str);
}

