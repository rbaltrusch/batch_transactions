# Batch transaction management system

An object-oriented transaction management system written in MSDOS Batch to test out the object-oriented capabilities of the [objectbatch](https://github.com/rbaltrusch/objectbatch) framework.

The repository includes two transaction classes, as well as a transaction management class, all of which are instantiated and used in conjunction in the main.bat file.

## Getting started

Clone the repository and its submodules, then run the main.bat file:

```batch
git clone https://github.com/rbaltrusch/chess_bot
git submodule update --init --recursive
cd src
call main.bat
```

To run the unit tests for this repository, call the tests/run_tests.bat script from the root directory:
```batch
call tests/run_tests.bat
```

## Dependencies

This repository has two prime dependencies, both of which are added as git submodules to this repository:
- objectbatch (OOP framework for batch scripts)
- batest (unit test framework for batch scripts)

## Python implementation

The functionality present in the main.bat file was also implemented in an equivalent [main.py](https://github.com/rbaltrusch/batch_transactions/blob/master/src/main.py) file, primarily to showcase the differences and similarities between the batch OOP and the python OOP approaches.

## License

This repository is licensed as open-source software under the [MIT License](https://github.com/rbaltrusch/batch_transactions/blob/master/LICENSE).

## Contact

For code changes or suggestions, please raise an issue. For anything else, contact richard@baltrusch.net.
