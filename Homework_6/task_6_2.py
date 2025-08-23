# Задание 2: Площадь прямоугольника

try:
    length = int(input("Введите длину прямоугольника: "))
    width = int(input("Введите ширину прямоугольника: "))
    
    if length <= 0 or width <= 0:
        print("Нужно вводить положительные числа!")
    else:
        print(f"Площадь прямоугольника равна {length * width}")

except ValueError:
    print("Нужно вводить число, а не текст!")
