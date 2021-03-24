import hy
import interpreter
import pytest
from version import VERSION


@pytest.mark.skipif(VERSION < 0.3, reason="Test wants version 0.2")
@pytest.mark.parametrize(
    "program, expected",
    (
        (
            (
                "Apple Pear Banana // Comment on the morality of fruit as a pizza topping. "
                "Or do something else with your time"
            ),
            "applepearbanana"
        ),
    )
)
def test_assignment_3_1(program, expected):
    assert interpreter.interpreter(program) == expected


@pytest.mark.skipif(VERSION < 0.3, reason="Test wants version 0.2")
def test_assignment_3_2():
    program = "This is quite a long sentence, // Is it not?"
    assert pytest.raises(
        interpreter.InvalidCharacter,
        interpreter.interpreter,
        program
    )
