# Задание 3: Конвертер температур 

try:
    celsius_degrees = float(input("Введите температуру в градусах Цельсия: "))
    fahrenheit_degrees = celsius_degrees * 9 / 5 + 32
    print(f"{celsius_degrees:.1f}°C 'это ' {fahrenheit_degrees:.1f}°F")

except ValueError:
    print("Нужно ввести число, а не текст!")    
