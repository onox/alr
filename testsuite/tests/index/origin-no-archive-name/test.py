"""
Test that origins lacking archive names in indexes are properly reported.
"""

from glob import glob
import os

from drivers.alr import run_alr
from drivers.asserts import assert_eq


p = run_alr('show', 'hello_world', complain_on_error=False)
assert_eq(
    'ERROR: hello_world (origin): Unable to determine archive name: please'
    ' specify one'
    '\nNot found: hello_world with Newest version'
    '\n', p.out)

print('SUCCESS')
