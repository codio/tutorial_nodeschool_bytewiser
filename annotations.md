@annotation:tour buffer_from_string
#1. Buffer From String
##Challenge
In Node.js, [`Buffer`]((http://nodejs.org/api/all.html#all_buffer)) is a global object that provides a way to work with different kinds of binary data. Most APIs in Node core (e.g. http, net, fs) will give you buffers, and will be able to do their job faster if you give them buffers.

For this challenge, write a node program that prints a buffer object containing the string "bytewiser" using console.log.

When you have completed your program, you can run it in the test environment with:

    bytewiser run program.js

And once you are happy that it is correct then run:

    bytewiser verify program.js

And your submission will be verified for correctness. After you have a correct solution, run `bytewiser` again and select the next problem!

To get output for debugging when running `bytewiser run program.js` you should use `console.error` instead of `console.log`.

###Documentation

- [Buffers](http://nodejs.org/api/all.html#all_buffer)


@annotation:tour hexadecimal_encoding
#2. Hexadecimal Encoding
##Challenge
You can convert data between different representations, also known as encodings, using Buffers.

Write a node program that takes the following 6 bytes, converts them to a hexidecimal string using a Buffer and logs them to the console.

    0 15 24 3 250 83

Hexadecimal encoding is a way of representing integers 0 through 16 using the 10 digits 0 - 9 and 6 letters a - f.

A single hexidecimal octet is two hex characters long, which can represent a number between 0 and 255 (16 * 16 possibilities).

For example, the number 255 in hex is ff, as f is 15 in hex. Sometimes hex values are written with a 0x prefix, so you might see 255 written as 0xff.

##Hints

Use  [`.toString`](http://nodejs.org/api/buffer.html#buffer_buf_tostring_encoding_start_end)

###Documentation
- [buffers](http://nodejs.org/api/all.html#all_buffer) module
- [.toString](http://nodejs.org/api/buffer.html#buffer_buf_tostring_encoding_start_end)


@annotation:tour modifying_buffers
#3. Modifying Buffers
##Challenge
Buffers are similar to Arrays in that you can get and set values at particular offsets.

Write a program that takes the first buffer written to `process.stdin`, updates all instances of . with ! and then logs out the updated buffer object.

Bonus points if you never call `.toString()` on your buffer!

##Hints
Buffers have a [`.write`](http://nodejs.org/api/all.html#all_buf_write_string_offset_length_encoding) method that can be used to a character to a specific offset.

The integer value of the ascii character . is 46.

###Documentation
- [buffers](http://nodejs.org/api/all.html#all_buffer) module
- [`buf.write()`](http://nodejs.org/api/all.html#all_buf_write_string_offset_length_encoding)


@annotation:tour line_splitter
#4. Splitting Lines
##Challenge
The argument given to you from `process.argv[2]` will be a path to a file.

Read this file and split it by newline characters ('\n'). You should log one Buffer per line.

Bonus points if you never use `.toString()`.

##Hints
Buffers have a [`.slice`](http://nodejs.org/api/all.html#all_buf_slice_start_end) method that can be used to grab a sub-selection as a view (no memcpy).

Extra bonus points if you avoid using fs.readFileSync.

###Documentation
- [buffers](http://nodejs.org/api/all.html#all_buffer) module
- [`buf.slice`](http://nodejs.org/api/all.html#all_buf_slice_start_end)


@annotation:tour buffer_concat
#5. Concatenating Buffers
##Challenge
I/O streams in node (like [fs.createReadStream](http://nodejs.org/api/fs.html#fs_fs_createreadstream_path_options) for example) will emit incremental Buffers as they arrive as opposed to waiting for the full data to arrive.

The benefit is that if you are reading or downloading a huge file you can start processing it immediately in chunks. This is especially useful for files that are larger than your available RAM.

However, sometimes you want the entire file in one big Buffer.

Write a program that combines all of the buffers from `process.stdin` and then writes the single big buffer out to the console.

Bonus points if you use a stream!

##Hints
Use [Buffer.concat](http://nodejs.org/api/buffer.html#buffer_class_method_buffer_concat_list_totallength)

###Documentation
- [buffers](http://nodejs.org/api/all.html#all_buffer) module
- [`buf.concat`](http://nodejs.org/api/buffer.html#buffer_class_method_buffer_concat_list_totallength)


@annotation:tour typed_arrays
#6. Typed Arrays
##Challenge
Typed Arrays offer another way to work with binary data. They were first added to JS in 2010 and have now been standardized across most browsers thanks to the WebGL specification for 3D programming in the browser. Typed Arrays don't have as much built-in functionality as Buffers in node, but they have the unique advantage of working in browsers.

There are various flavors of Typed Arrays. Uint8Array is most similar to Buffer. The U in Uint means 'unsigned', which is equivalent to saying 'positive integers only'. Int8Array, on the other hand, can store positive and negative values.

For this challenge, read the first buffer from process.stdin, copy all bytes into a Uint8Array and then log out a JSON stringified representation of the typed array.

###Documentation
- [Typed Arrays](http://developer.mozilla.org/en-US/docs/Web/JavaScript/Typed_arrays)
- [`JSON.stringify`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify)


@annotation:tour array_buffers
#7. Array Buffers
##Challenge
Array Buffers are the backend for Typed Arrays. Whereas Buffer in node is both the raw bytes as well as the encoding/view, Array Buffers are only raw bytes and you have to create a Typed Array on top of an Array Buffer in order to access the data.

When you create a new Typed Array and don't give it an Array Buffer to be a view on top of it will create it's own new Array Buffer instead.

For this challenge, take the integer from process.argv[2] and write it as the first element in a single element Uint32Array. Then create a Uint16Array from the Array Buffer of the Uint32Array and log out to the console the JSON stringified version of the Uint16Array.

**Bonus**: try to explain the relevance of the integer from process.argv[2], or explain why the Uint16Array has the particular values that it does.

###Documentation
- [Typed Arrays](http://developer.mozilla.org/en-US/docs/Web/JavaScript/Typed_arrays)
- [`JSON.stringify`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify)

