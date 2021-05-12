#!/usr/bin/env python3

'''
on-modify hook that removes tags used in my workflow.
Based on timewarrior hook
see https://github.com/mpoquet/taskwarrior-scripts/blob/master/hook-on-modify-timewarrior.py
'''
import json
import sys

def retrieve_args_dict():
    '''Read process arguments and store them in a dictionary.'''
    process_args = sys.argv[1:]
    dictionary = dict()
    for process_arg in process_args:
        splitted = process_arg.split(':')
        if len(splitted) > 1:
            key = splitted[0]
            value = ''.join(splitted[1:])
            dictionary[key] = value
    return dictionary

def main():
    '''Main function of this module.'''
    old_task = json.loads(sys.stdin.readline())
    new_task = json.loads(sys.stdin.readline())
    args = retrieve_args_dict()

    # Do something.
    feedback = None
    if 'api' in args: # Only do something for known API.
        if args['api'] in ['2']: # APIs that give us a 'command' key.
            cmd = args['command']
            if cmd == 'done':
                if new_task['status'] == 'completed' and 'today' in new_task['tags']:
                    new_task['tags'].remove('today')
            if 'recur' in new_task and 'today' not in new_task['tags']:
                new_task['tags'].append('today')

    # Generate output as task expects it.
    print(json.dumps(new_task))
    if feedback is not None:
        print(feedback)
    sys.exit(0)

if __name__ == "__main__":
    main()
