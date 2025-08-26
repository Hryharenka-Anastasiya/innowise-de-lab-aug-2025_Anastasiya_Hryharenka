# Задание  6: Калькулятор (Опциональное) 

result = float(input("Введите первое число: "))
history = str(result)

math_operation = input("(Введите +, -, *, /, =): ")

while math_operation != "=":
    number = float(input("Введите число: "))

    if math_operation == "+":
        result += number
        history += f" + {number}"

    elif math_operation == "-":
        result -= number
        history += f" - {number}"

    elif math_operation == "*":
        result *= number
        history += f" * {number}"

    elif math_operation == "/":
        if number == 0:
            print("На 0 делить нельзя!")
        else:
            result /= number
            history += f" / {number}"
            
    print("Текущий результат:", result)
    math_operation = input("(Введите +, -, *, /, =): ")

print(f"Ваше выражение: {history} = {result}")    
