extern {
    fn my_printk(str: &[u8]);
}

#[no_mangle]
pub fn init_module() -> int {
    unsafe {
        my_printk("rust_linux: Hello Linux from Rust\n".as_bytes());
    }
    return 0;
}

#[no_mangle]
pub fn cleanup_module() {
    unsafe {
       my_printk("rust_linux: Goodby Linux from Rust\n".as_bytes());
    }
}

