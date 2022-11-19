"""
Common code to write task warrios hooks
Inspired on timewarrior
see https://github.com/mpoquet/taskwarrior-scripts/blob/master/hook-on-modify-timewarrior.py
"""
import sys


def retrieve_args_dict():
    """Read process arguments and store them in a dictionary."""
    process_args = sys.argv[1:]
    dictionary = dict()
    for process_arg in process_args:
        splitted = process_arg.split(":")
        if len(splitted) > 1:
            key = splitted[0]
            value = "".join(splitted[1:])
            dictionary[key] = value
    return dictionary
