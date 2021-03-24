import hy
import interpreter
import pytest


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


def test_assignment_3_2():
    program = "This is quite a long sentence, // Is it not?"
    assert pytest.raises(
        interpreter.InvalidCharacter,
        interpreter.interpreter,
        program
    )
