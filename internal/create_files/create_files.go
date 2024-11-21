package create_files

import (
	"github.com/gobeam/stringy"
	"unicode"
)

// PascalCase - переводит строку в PascalCase
func PascalCase(s string) string {
	Otvet := ""

	str := stringy.New(s)
	Otvet = str.PascalCase("?", "").Get()
	Otvet = pascalCaseReformatNumbers(Otvet)

	return Otvet
}

// pascalCaseReformatNumbers - после цифр буквы должны быть в верхнем регистре
func pascalCaseReformatNumbers(s string) string {
	Otvet := ""

	var last rune
	for _, s1 := range s {
		if last >= 48 && last <= 57 {
			s1 = unicode.ToUpper(s1)
		}
		Otvet = Otvet + string(s1)
		last = s1
	}

	return Otvet
}

// CamelCase - переводит строку в camel_case
func CamelCase(s string) string {
	Otvet := ""

	str := stringy.New(s)
	Otvet = str.CamelCase("?", "").Get()
	Otvet = pascalCaseReformatNumbers(Otvet)

	return Otvet
}
