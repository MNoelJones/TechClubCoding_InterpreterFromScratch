import hy
import interpreter
import pytest
from version import VERSION


@pytest.mark.skipif(VERSION != 0.4, reason="Test wants version 0.2")
@pytest.mark.parametrize(
    "progfile, expected",
    (
        (
            "tests/test4.txt",
            "avdqvdmavvqmiqiiifvdlfbffiiiflblblfbqviiifbfiiifwdfwwiif"
        ),
    )
)
def test_assignment_2(progfile, expected):
    assert interpreter.interpreter(file=progfile) == expected
