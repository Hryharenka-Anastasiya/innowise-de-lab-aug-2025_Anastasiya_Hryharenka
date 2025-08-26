# Рисуем Прямоугольник (optional)

try:
    height  = int(input("Введите высоту прямоугольника: "))
    width = int(input("Введите ширину прямоугольника: "))
    
    for i in range(height):
        print("*" * width)
    
except ValueError:
    print("Нужно вводить число, а не текст!")