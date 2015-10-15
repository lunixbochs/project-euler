class Node:
    def __init__(self, value):
        self.value = value
        self.parents = []
        self._left = None
        self._right = None
        self._max = None

    @property
    def max(self):
        if self._max is None:
            if not (self.left or self.right):
                self._max = 0
            else:
                self._max = max(self.left.max, self.right.max)
        return self._max + self.value

    @property
    def left(self):
        return self._left

    @left.setter
    def left(self, obj):
        obj.parents.append(self)
        self._left = obj

    @property
    def right(self):
        return self._right

    @right.setter
    def right(self, obj):
        obj.parents.append(self)
        self._right = obj

    def __repr__(self):
        return repr(self.value)


if __name__ == '__main__':
    with open('input', 'r') as f:
        data = f.read().strip().split('\n')

    lines = []
    for line in data:
        vals = [Node(int(v)) for v in line.split(' ')]
        lines.append(vals)

    for i, nodes in enumerate(lines[:-1]):
        next_line = lines[i + 1]
        for j, node in enumerate(nodes):
            node.left, node.right = next_line[j:j + 2]

    for nodes in reversed(lines[:-1]):
        for node in nodes:
            node.max

    print lines[0][0].max
