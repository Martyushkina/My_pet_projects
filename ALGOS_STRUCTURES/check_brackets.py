#реализация проверки правильности скобочных последовательностей с помощью стека
def check_brackets(text):
    stack = []
    ind_stack = []
    brackets_open = ['[', '{', '(']
    brackets_close = [']', '}', ')']
    ind = 0
    for s in text:
        ind += 1
        if s in brackets_open:
            stack.append(s)
            ind_stack.append(ind)
        elif s in brackets_close:
            if len(stack) == 0:
                return ind
            top = stack.pop(-1)
            del ind_stack[-1]
            if (top == '[' and s != ']') or (top == '{' and s != '}') or (top == '(' and s != ')'):
                return ind
    if len(stack) == 0:
        return 'Success'
    else:
        return ind_stack[0]
                

text = input()
print(check_brackets(text))

