# Упражнение 2: Методы строк и форматинг

email = " USER@DOMAIN.COM "

# 1. Очистить и отформатировать до вида: "user@domain.com"
email = email.strip().lower()
print(email)

# 2. Разделить на имя пользователя и домен
username = email.split("@")[0]
domain = email.split("@")[1]
print("Имя пользователя:", username)
print("Домен:", domain)

# 3. Используя f-строку, создать: "Username: user, Domain: domain.com"
result = f"Username: {username}, Domain: {domain}"
print(result)
