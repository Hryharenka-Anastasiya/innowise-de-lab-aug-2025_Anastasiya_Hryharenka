# Задача 2: Обратный отсчет до запуска 

try:
    start = int(input("Введите число для обратного отсчёта: "))
    if start <= 0:
        print("Введите число больше 0!")

    else:    
        for i in range(start, 0, -1):
            print(f'{i}...')
        print('Go!')

except ValueError:
    print("Нужно вводить число, а не текст!")