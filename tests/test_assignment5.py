import hy
import interpreter
import pytest
from version import VERSION


@pytest.mark.skipif(VERSION < 0.5, reason="Test wants version 0.2")
@pytest.mark.parametrize(
    "command, expected",
    (
        (
            'run "hqdtmldubx //top secret info"',
            "hqdtmldubx"
        ),
        (
            "file tests/test4.txt",
            "avdqvdmavvqmiqiiifvdlfbffiiiflblblfbqviiifbfiiifwdfwwiif"
        ),
    )
)
def test_assignment_5_1(command, expected):
    assert interpreter.interpreter(command) == expected


@pytest.mark.skipif(VERSION < 0.5, reason="Test wants version 0.2")
def test_assignment_5_2():
    command = 'decipher "hqdtmldubx // top secret info"'
    assert pytest.raises(
        interpreter.InvalidCommand,
        interpreter.interpreter,
        command
    )
