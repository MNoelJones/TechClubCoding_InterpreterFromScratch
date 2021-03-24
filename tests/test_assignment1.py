import hy
import interpreter
import pytest
from version import VERSION


@pytest.mark.skipif(VERSION != 0.1, reason="Test wants version 0.1")
@pytest.mark.parametrize(
    "program, expected",
    (
        ("Hello World!", "helloworld!"),
        (
            "this is quite a LONG sentence, is it not?",
            "thisisquitealongsentence,isitnot?"
        )
    )
)
def test_assignment_1(program, expected):
    assert interpreter.interpreter(program) == expected
