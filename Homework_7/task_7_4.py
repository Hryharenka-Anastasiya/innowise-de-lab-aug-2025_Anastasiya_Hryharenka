# Задача 4: Обработка данных 

scores = [75, 88, -10, 95, 100, -25, 89]
total_score = 0 

for score in scores:
    if score == 0:
        print("Обработка прервана.")
        break
    elif score < 0:
        continue  
    print(f"Добавлен балл: {score}")
    total_score += score
    
else:
    print("Все данные обработаны корректно.")

print(f"Итоговая сумма баллов: {total_score}") 