# Задание 4: Игра «Угадай число»

import random

print("Я загадал число от 1 до 5. Попробуй угадать!")
hidden_number = random.randint(1, 5)

try:
    input_number = int(input("Введите число: "))

    if input_number == hidden_number:
      print("Ты угадал!")
    elif input_number > hidden_number:
        print("Слишком много!")
    else:
        print("Слишком мало!")

except ValueError:
    print("Нужно вводить число, а не текст!")
