# refcard

A reference card class for LaTeX2e.

According to [Wikipedia](https://en.wikipedia.org/wiki/Cheat_sheet), 
a cheat sheet is a concise set of notes used for quick reference.
Some might even call it a [reference card or sheet](https://en.wikipedia.org/wiki/Reference_card), 
hence the name.

This small class is aimed to make the typesetting of 
reference cards a bit less tedious, so you can focus on using them.
The class is inspired from the question and answer 
[Document Class for Reference Cards](https://tex.stackexchange.com/q/99765).

Since `refcard` is based on `article` most options can be passed on.

## Additional Options

  * `columns=<num>`    How many columns, default is 3.
  * `margin=<length>` Passed to `geometry`, default 1 cm.

## Disabled Options

  * `portrait`   only supports `landscape`; ignored, warning.
  * `titlepage`  saving space, so no title page; ignored, warning.
  * `twocolumn`  class uses `multicol`; break, error.

## Features

  * Dense settings to save maximum space.
  * No enumeration of (sub)sections.
  * Customised itemise environments.

## Acknowledgements

Thanks to the following people, who have contributed to the
original implementation:
 Mike Renfro ([Mike Renfro](https://tex.stackexchange.com/users/3345),
  [mikerenfro](https://github.com/mikerenfro));
 Sean Allred ([Sean Allred](https://tex.stackexchange.com/users/17423),
  [vermiculus](https://github.com/vermiculus));
 Eric Berquist, ([berquist](https://github.com/berquist)).

Currently maintained by Martin C Schwarzer ([Martin-マーチン](https://chemistry.stackexchange.com/users/4945),
  [polyluxus](https://github.com/polyluxus)).


Other code has also been imported into this repository. 
This is also highlighted in the commented source code.

 - Part of the code is adapted from the answer of Werner ([Werner](https://tex.stackexchange.com/users/5764)):
   [How to create a command with key values?](https://tex.stackexchange.com/a/34314/33413)

 - The automatically adjusting label width is based on the answers by user121799 (no stack exchange profile page)
   and Gonzalo Medina ([Gonzalo Medina](https://tex.stackexchange.com/users/3954)):
   - [Why conflict between mathtools and Gonzalo's solution for auto-adjusting description environment?](https://tex.stackexchange.com/q/461056/33413)
   - [Automatically set description list `labelwidth` based on widest label?](https://tex.stackexchange.com/q/130097/33413)

 - Expansion of column types in array tables is based on the code provided by Bruno Le Floch
   ([Bruno Le Floch](https://tex.stackexchange.com/users/2707)):
   [How do I expand a macro into a tabular head?](https://tex.stackexchange.com/a/14460/33413)

## License

The class is licensed [CC-BY-SA 4.0](LICENSE.markdown).

