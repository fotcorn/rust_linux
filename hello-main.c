int my_printk(const char* str);

int init_module(void)
{
    my_printk("<1>Hello-main:init()\n");
    return 0;
}

void cleanup_module(void)
{
    my_printk("<1>Hello-main:exit() -- Goodbye\n");
}

