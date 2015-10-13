patterns = [
'This command updates brew itself, and does not take formula names.'
            ]


def match(command, settings):
    for pattern in patterns:
        if pattern.lower() in command.stderr.lower():
            return True
    return False


def get_new_command(command, settings):
    array = command.script.split(" ")
    index = array.index('update')+1
    return 'brew upgrade ' + array[index]
