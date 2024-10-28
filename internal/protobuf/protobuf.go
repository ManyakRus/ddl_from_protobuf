package protobuf

import (
	"fmt"
	"github.com/ManyakRus/starter/folders"
	"github.com/ManyakRus/starter/micro"
	"github.com/emicklei/proto"
	"os"
)

type optionLister struct {
	proto.NoopVisitor
}

// messagesAll - хранит все message из всех .proto
var messagesAll []*proto.Message

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
	Otvet, err = folders.FindFiles_FromDirectory(dir, ".proto")
	if err != nil {
		err = fmt.Errorf("FindFiles_FromDirectory(%s) error: %w", dir, err)
		return Otvet, err
	}

	return Otvet, err
}

// FindProtobufAll - возвращает массив описания .proto файлов в формате []pbparser.ProtoFile
func FindProtobufAll(dir string) ([]*proto.Message, error) {
	Otvet := make([]*proto.Message, 0)
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
		reader, err := os.Open(File)
		defer reader.Close()
		if err != nil {
			err = fmt.Errorf("Open(%s) error: %w", File, err)
			return Otvet, err
		}

		parser := proto.NewParser(reader)
		definition, _ := parser.Parse()

		proto.Walk(definition,
			proto.WithMessage(handleMessage))

	}

	return Otvet, err
}

func handleMessage(m *proto.Message) {
	lister := new(optionLister)
	for _, each := range m.Elements {
		each.Accept(lister)
	}
	fmt.Println(m.Name)
}
