#!/usr/bin/env python3

'''
Hook to manipulate task when are modified
Inspired on timewarrior
'''
import json
import sys
import hooks

def main():
    '''Main function of this module.'''
    old_task = json.loads(sys.stdin.readline())
    new_task = json.loads(sys.stdin.readline())
    args = hooks.retrieve_args_dict()

    # Do something.
    feedback = None
    if 'api' in args: # Only do something for known API.
        if args['api'] in ['2']: # APIs that give us a 'command' key.
            cmd = args['command']
            tags = new_task.setdefault('tags', [])
            if cmd == 'done':
                if new_task['status'] == 'completed' and 'scheduled' in tags:
                   tags.remove('scheduled')

    # Generate output as task expects it.
    print(json.dumps(new_task))
    if feedback is not None:
        print(feedback)
    sys.exit(0)

if __name__ == "__main__":
    main()
