import sys
import csv
import copy

class Solution:

    def __init__(self, filename, capacity, time):
        self.filename = filename
        self.capacity = int(capacity)
        self.time = time

    def process_input(self):
        item_names = []
        item_values = []
        item_weights = []
        with open(self.filename, newline='') as csvfile:
            reader = csv.reader(csvfile, delimiter=',', quotechar='|')
            for row in reader:
                item_names.append(row[0])
                item_values.append(int(row[1]))
                item_weights.append(int(row[2]))

        return item_names, item_values, item_weights

    def find_allocation(self):
        item_names, item_values, item_weights = self.process_input()
        num = len(item_names)
        memory = [[0 for i in range(self.capacity+1)] for j in range(num+1)]

        solution = [[[] for i in range(self.capacity+1)] for j in range(num+1)]

        for i in range(num + 1):
            for w in range(self.capacity + 1):
                if i == 0 or w == 0:
                    memory[i][w] = 0
                elif item_weights[i - 1] <= w:
                    without_current_item =  memory[i - 1][w]
                    with_current_item = item_values[i - 1] + memory[i - 1][w - item_weights[i - 1]]
                    if without_current_item > with_current_item:
                        memory[i][w] = without_current_item
                        solution[i][w] = copy.deepcopy(solution[i-1][w])
                    else:
                        solution[i][w] = copy.deepcopy(solution[i-1][w - item_weights[i-1]])
                        solution[i][w].append(item_names[i-1])
                        memory[i][w] = with_current_item
                    memory[i][w] = max(item_values[i - 1] + memory[i - 1][w - item_weights[i - 1]], memory[i - 1][w])
                else:
                    solution[i][w] = copy.deepcopy(solution[i-1][w])
                    memory[i][w] = memory[i - 1][w]
        self.print_results(solution)

    def print_results(self, solution):
        for item in solution[-1][-1]:
            print(item),


filename = sys.argv[1]
capacity = sys.argv[2]
time = sys.argv[3]
s = Solution(filename, capacity, time)
s.find_allocation()




