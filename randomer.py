import random


# Class used to generate random numbers set with provided size user wants
class RandomUniqueNumberGenerator:
    def __init__(self, n_numbers):
        self.set = set()
        self.n_numbers = n_numbers

    def generate(self):
        while len(self.set) != self.n_numbers:
            self.set.add(random.randint(1, 50))

    def get_random_numbers(self):
        self.generate()
        return self.set
