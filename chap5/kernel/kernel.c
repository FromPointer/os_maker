void some_function() {

}

// write kernel code
void main() {
    char *video_memory = (char*) 0xb8000;
    *video_memory = 'X';

    // call some function
    some_function();
}
