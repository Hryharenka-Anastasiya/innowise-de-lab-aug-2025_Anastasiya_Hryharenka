# Упражнение 3: Методы списка

fruits = ["apple", "banana"]

# 1. Добавьте "orange" в конец списка
fruits.append("orange")
print(fruits)

# 2. Вставьте "grape" по индексу 1
fruits.insert(1, "grape")
print(fruits)

# 3. Удалите "banana"
if "banana" in fruits:   # проверка "безопасности"
    fruits.remove("banana")
print(fruits)

# 4. Отсортируйте список
fruits.sort()
print(fruits)

# 5. Переверните список
fruits.reverse()
print(fruits)
