import hy
import interpreter
import pytest


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
