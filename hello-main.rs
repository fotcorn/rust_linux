extern {
    fn my_printk(str: &[u8]);
}

#[no_mangle]
pub fn init_module() -> isize {
    unsafe {
        my_printk("<1>rust_linux::Hello Linux from Rust".as_bytes());
    }
    return 0;
}

#[no_mangle]
pub fn cleanup_module() {
    unsafe {
       my_printk("<1>Goodby Linux from Rust".as_bytes());
    }
}

