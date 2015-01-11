int printk(const char *fmt, ...);

static const char __mod_license3[]
    __attribute__((__used__))
    __attribute__((section(".modinfo"), unused, aligned(1))) = "license" "=" "Dual BSD/GPL";


int __attribute__ ((__section__(".init.text")))
    __attribute__ ((__cold__))
    __attribute__ ((no_instrument_function))
init_module(void)
{
    printk("<1>" "Hello-main:init()\n");
    return 0;
}

void __attribute__ ((__section__(".exit.text")))
     __attribute__((__cold__))
     __attribute__((no_instrument_function))
cleanup_module(void)
{
    printk("<1>" "Hello-main:exit() -- Goodbye\n");
}

