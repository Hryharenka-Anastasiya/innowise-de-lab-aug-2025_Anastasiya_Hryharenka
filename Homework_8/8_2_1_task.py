# Упражнение 1: Функции без параметров

# Создайте функцию без параметров show_current_time() — печатает
# текущие дату и время (используйте модуль datetime).


from datetime import datetime, timezone

def show_current_time():
    current_time = datetime.now(timezone.utc)  
    print(current_time)

show_current_time()
