extern {
    fn printk(str: &[u8]);
}

#[no_mangle]
pub fn init_module() -> isize {
    unsafe {
        printk("rust_linux: Hello Linux from Rust\n".as_bytes());
    }
    return 0;
}

#[no_mangle]
pub fn cleanup_module() {
    unsafe {
       printk("rust_linux: Goodby Linux from Rust\n".as_bytes());
    }
}
