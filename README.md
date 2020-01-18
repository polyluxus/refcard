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
  [vermiculus](https://github.com/vermiculus);
 Eric Berquist], ([berquist](https://github.com/berquist)).

Currently maintained by Martin C Schwarzer ([Martin-マーチン](https://chemistry.stackexchange.com/users/4945),
  [polyluxus](https://github.com/polyluxus)).

The class and the document are licensed [CC-BY-SA 4.0](LICENSE.markdown).

