#!/usr/bin/env python3

'''
Hook to manipulate task when are added
Inspired on timewarrior
'''
import json
import sys
import hooks

def main():
    '''Main function of this module.'''
    task = json.loads(sys.stdin.readline())
    args = hooks.retrieve_args_dict()

    # Do something.
    feedback = None
    if 'api' in args: # Only do something for known API.
        if args['api'] in ['2']: # APIs that give us a 'command' key.
            tags = task.setdefault('tags', [])
            if 'recur' in task and 'heute' not in tags \
                    and task['status'] == 'pending':
                tags.append('heute')

    # Generate output as task expects it.
    print(json.dumps(task))
    if feedback is not None:
        print(feedback)
    sys.exit(0)

if __name__ == "__main__":
    main()
