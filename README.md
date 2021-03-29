# TechClubCoding_InterpreterFromScratch

This should all run under Python3 (and maybe Python2, although I haven't tested that - it's deprecated, after all!)

Beyond a working Python environment, you will need to install [`hy`](https://docs.hylang.org/en/stable/index.html), which can be accomplished using pip:
```bash
	pip install hy
```
(I'd suggest using a virtualenv)

The test cases need pytest
```bash
	pip install pytest
```

(Both requirements are satisfied by running:
```bash
	pip install -r requirements.txt
```
)

I find that pytest doesn't pick up the environment correctly if it's run directly from the command line, so I suggest calling it via python:
```bash
python -m pytest 
``` # To run all tests
```bash
python -m pytest tests/test_assignment1.py
``` # To run a specific test

Every assignment step (except for the first!) has its own branch. They have (I hope!) obvious names
