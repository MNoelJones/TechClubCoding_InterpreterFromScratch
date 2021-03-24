import hy
import interpreter
import pytest
from version import VERSION


@pytest.mark.skipif(VERSION != 0.2, reason="Test wants version 0.2")
@pytest.mark.parametrize(
    "program, expected",
    (
        ("Hello World! //commented out", "helloworld!"),
        (
            "This is quite a long sentence, // Is it not?",
            "thisisquitealongsentence,"
        )
    )
)
def test_assignment_2(program, expected):
    assert interpreter.interpreter(program) == expected
