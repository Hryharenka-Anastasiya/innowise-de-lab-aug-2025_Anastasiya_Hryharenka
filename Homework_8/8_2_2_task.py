# Упражнение 2: Функции с параметрами

# 1) Вынесите расчёт в функцию add_vat().
# 2) Примените её ко всем элементам списка в цикле и распечатайте итоговые цены, используйте цикл.

nds = 0.20

def add_vat(price):
    return price + price * nds

prices = [1000, 3499, 250]
for price in prices:
    print(add_vat(price))
