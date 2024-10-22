package protobuf

import (
	"fmt"
	"github.com/ManyakRus/starter/folders"
	"github.com/ManyakRus/starter/micro"
	"github.com/tallstoat/pbparser"
)

// FindProtobufFiles - возвращает список файлов .proto
func FindProtobufFiles(dir string) ([]string, error) {
	Otvet := make([]string, 0)
	var err error

	//проверим существование директории
	ok, err := micro.FileExists(dir)
	if err != nil {
		err = fmt.Errorf("FileExists(%s) error: %w", dir, err)
		return Otvet, err
	}
	if ok != true {
		err = fmt.Errorf("FileExists(%s) error: file not found", dir)
		return Otvet, err
	}

	//
	Otvet, err = folders.FindFiles_FromDirectory(dir, ".go")
	if err != nil {
		err = fmt.Errorf("FindFiles_FromDirectory(%s) error: %w", dir, err)
		return Otvet, err
	}

	return Otvet, err
}

// FindProtobufAll - возвращает массив описания .proto файлов в формате []pbparser.ProtoFile
func FindProtobufAll(dir string) ([]pbparser.ProtoFile, error) {
	Otvet := make([]pbparser.ProtoFile, 0)
	var err error

	//найдём все файлы .proto
	Files, err := FindProtobufFiles(dir)
	if err != nil {
		err = fmt.Errorf("FindProtobufFiles(%s) error: %w", dir, err)
		return Otvet, err
	}
	if len(Files) == 0 {
		err = fmt.Errorf("FindProtobufFiles(%s) error: files not found", dir)
		return Otvet, err
	}

	//пропарсим файлы
	for _, File := range Files {
		ProtoFile, err := pbparser.ParseFile(File)
		if err != nil {
			err = fmt.Errorf("ParseFile(%s) error: %w", File, err)
			return Otvet, err
		}
		Otvet = append(Otvet, ProtoFile)
	}

	return Otvet, err
}
