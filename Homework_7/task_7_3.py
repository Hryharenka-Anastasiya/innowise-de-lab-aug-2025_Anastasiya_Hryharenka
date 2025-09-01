# Задача 3: Угадай число 

import random

hidden_number = random.randint(1, 10)
try:
    input_number = int(input("Угадайте число от 1 до 10: "))

    while input_number != hidden_number:
        print('Неверно, попробуйте еще раз. ')
        input_number = int(input("Угадайте число от 1 до 10: "))

    print('Поздравляю! Вы угадали число! ')
    
except ValueError:
    print("Нужно вводить число, а не текст!")