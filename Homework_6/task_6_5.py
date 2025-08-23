# Задание 5: Проверка числа на чётность

try:
    number = int(input("Введите целое число: "))

    if number % 2 == 0:
      print(f"Число {number} чётное.")
    else:
      print(f"Число {number} нечётное.")

except ValueError:
    print("Нужно ввести число, а не строку!")
