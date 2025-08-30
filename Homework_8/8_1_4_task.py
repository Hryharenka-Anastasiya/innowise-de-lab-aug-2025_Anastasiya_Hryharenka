# Упражнение 4: List comprehension и словари

words = ["hello", "world", "python", "code"]

# 1. Создать список длин слов, используя списковое включение
length_words = [len(word) for word in words]
print(length_words)

# 2. Создать список слов длиннее 4 символов
words_over_4 = [word for word in words if len(word) > 4]
print(words_over_4)

# 3. Создать словарь: {слово: длина} для всех слов
word_length = {word: len(word) for word in words}
print(word_length)
