#!/bin/bash

highlight() {
	tput setaf $1
	echo $2
	tput setaf 7
}

# Тест 1: Запуск скрипта без параметров
test1() {
	./$1 > /dev/null
	if (( 26 == $? )); then
		highlight 2 "Done"
	else
		highlight 1 "Fail"
	fi
}

# Тест 2: Создание ссылки без параметров
test2() {
	./$1 -l > /dev/null
	if (( 23 == $? )); then
		highlight 2 "Done"
	else
		highlight 1 "Fail"
	fi
}

# Тест 3: Тест 2 для длинного флага
test3() {
	./$1 --link > /dev/null
	if (( 23 == $? )); then
		highlight 2 "Done"
	else
		highlight 1 "Fail"
	fi
}

# Тест 4: Создание ссылки на несуществующий файл
test4() {
	file=$(date +%s)
	./$1 -l $file link > /dev/null
	if (( 23 == $? )); then
		highlight 2 "Done"
	else
		highlight 1 "Fail"
	fi
}

# Тест 5: Тест 4 для длинного флага
test5() {
	file=$(date +%s)
	./$1 --link $file link > /dev/null
	if (( 23 == $? )); then
		highlight 2 "Done"
	else
		highlight 1 "Fail"
	fi
}

# Тест 6: Создание ссылки с именнем, которое занято
test6() {
	touch link
	./$1 -l $script link > /dev/null
	if (( 23 == $? )); then
		highlight 2 "Done"
	else
		highlight 1 "Fail"
	fi
	rm link
}

# Тест 7: Тест 6 для длинного флага
test7() {
	touch link
	./$1 --link $script link > /dev/null
	if (( 23 == $? )); then
		highlight 2 "Done"
	else
		highlight 1 "Fail"
	fi
	rm link
}

# Тест 8: Создание ссылки с корректными параметрами
test8() {
	link=$(date +%s)
	./$1 -l $1 $link > /dev/null
	if [[ -h $link ]]; then
		highlight 2 "Done"
		rm $link
	else
		highlight 1 "Fail"
	fi
}

# Тест 9: Удаление файла, не указывая параметры
test9() {
	./$1 -r > /dev/null
	if (( 24 == $? )); then
		highlight 2 "Done"
	else
		highlight 1 "Fail"
	fi
}

# Тест 10: Тест 9 для длинного флага
test10() {
	./$1 --remove > /dev/null
	if (( 24 == $? )); then
		highlight 2 "Done"
	else
		highlight 1 "Fail"
	fi
}

# Тест 11: Удаление несуществующего файла
test11() {
	file=$(date +%s)
	./$1 -r $file > /dev/null
	if (( 24 == $? )); then
		highlight 2 "Done"
	else
		highlight 1 "Fail"
	fi
}

# Тест 12: Тест 11 для длинного флага
test12() {
	file=$(date +%s)
	./$1 --remove $file > /dev/null
	if (( 24 == $? )); then
		highlight 2 "Done"
	else
		highlight 1 "Fail"
	fi
}

# Тест 13: Удаление файла
test13() {
	touch file
	./$1 -r file > /dev/null
	if [[ -e file ]]; then
		highlight 1 "Fail"
		rm file
	else
		highlight 2 "Done"
	fi
}

# Тест 14: Создание файла, не указывая параметры
test14() {
	./$1 -f > /dev/null
	if (( 25 == $? )); then
		highlight 2 "Done"
	else
		highlight 1 "Fail"
	fi
}

# Тест 15: Тест 14 для длинного флага
test15() {
	./$1 --file > /dev/null
	if (( 25 == $? )); then
		highlight 2 "Done"
	else
		highlight 1 "Fail"
	fi
}

# Тест 16: Создание файла с именем, которое занято
test16() {
	touch file
	./$1 -f file > /dev/null
	if (( 25 == $? )); then
		highlight 2 "Done"
	else
		highlight 1 "Fail"
	fi
	rm file
}

# Тест 17: Тест 16 для длинного флага
test17() {
	touch file
	./$1 --file file > /dev/null
	if (( 25 == $? )); then
		highlight 2 "Done"
	else
		highlight 1 "Fail"
	fi
	rm file
}

# Тест 18: Создание файла
test18() {
	file=$(date +%s)
	./$1 -f $file > /dev/null
	if [[ -f $file ]]; then
		highlight 2 "Done"
		rm $file
	else
		highlight 1 "Fail"
	fi
}
