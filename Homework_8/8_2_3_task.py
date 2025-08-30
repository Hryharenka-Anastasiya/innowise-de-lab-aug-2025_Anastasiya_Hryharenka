# Упражнение 3 (Опционально)

# Создайте функцию calculate_average_score(), которая будет вычислять средний балл.
# Функция должна принимать список оценок scores как обязательный аргумент.
# Добавьте опциональный булевый параметр ignore_lowest со значением по умолчанию False.
# Если ignore_lowest равен True, функция должна отбросить наименьшую оценку
# перед вычислением среднего. Если в списке всего одна оценка, отбрасывать её не нужно.
# Используя цикл, пройдитесь по списку student_data. 2 раза, первый раз
# учитывая все оценки, а второй раз отбросив худшие оценки


def calculate_average_score(scores, ignore_lowest = False):
    if not scores:
        return 0
    scores_to_use = scores.copy()

    if ignore_lowest and len(scores_to_use) > 1:
        lowest = min(scores_to_use)
        scores_to_use.remove(lowest)

    return sum(scores_to_use) / len(scores_to_use)


student_data = [
    {"name": "Alice", "scores": [90, 80, 70]},
    {"name": "Bob", "scores": [100, 60, 75]},
    {"name": "Charlie", "scores": [85]},
]

print("Средний балл без игнорирования минимальной оценки:")
for student in student_data:
    average = calculate_average_score(student["scores"])
    print(student["name"], average)

print("\nСредний балл с игнорированием минимальной оценки:")
for student in student_data:
    average = calculate_average_score(student["scores"], True)
    print(student["name"], average)
    