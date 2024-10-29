package protobuf

import (
	"fmt"
	"github.com/ManyakRus/ddl_from_protobuf/internal/types"
	"github.com/ManyakRus/starter/folders"
	"github.com/ManyakRus/starter/micro"
	"github.com/emicklei/proto"
	"log"
	"os"
)

//type optionLister struct {
//	proto.NoopVisitor
//}

//// messagesAll - хранит все message из всех .proto
//var messagesAll []*proto.Message
//
//// enumsAll - хранит все enum из всех .proto
//var enumsAll []*proto.Enum

// MapMessages - хранит все сообщения из всех .proto
var mapMessages = make(map[string]*types.MessageElement)

// MapEnums - хранит все enum из всех .proto
var mapEnums = make(map[string]*types.EnumElement)

//type Message struct {
//	Fields   []*proto.NormalField
//	Repeated bool
//	Optional bool
//	Required bool
//}

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
func FindProtobufAll(dir string) (types.ProtoAll, error) {
	Otvet := types.ProtoAll{}
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
			proto.WithMessage(handleMessage),
			proto.WithEnum(handleEnum))

		////
		////filename := definition.Filename
		////filename = path.Base(filename)
		//Otvet1 := types.ProtoAll{}
		////Otvet1.Filename = File
		//Otvet = append(Otvet, Otvet1)
	}

	Otvet.MapMessages = mapMessages
	Otvet.MapEnums = mapEnums

	return Otvet, err
}

// handleMessage - обрабатывает 1 message
func handleMessage(m *proto.Message) {
	//var err error

	//
	documentation := ""
	if m.Comment != nil {
		documentation = m.Comment.Message()
	}

	//
	Message1 := types.MessageElement{}
	Message1.Name = m.Name
	Message1.Documentation = documentation

	MassFields := make([]types.FieldElement, 0)

	// цикл по полям message
	for _, field1 := range m.Elements {
		//each.Accept(lister)
		//fmt.Println(field1)
		NormalField, ok := field1.(*proto.NormalField)
		if ok == false {
			//err = fmt.Errorf("field1.(*proto.NormalField) error")
			//log.Panic(err)
			continue
		}

		documentation := ""
		if NormalField.Comment != nil {
			documentation = NormalField.Comment.Message()
		}
		if documentation == "" && NormalField.InlineComment != nil {
			documentation = NormalField.InlineComment.Message()
		}

		Options := make([]types.OptionElement, 0)
		for _, option := range NormalField.Options {
			Option := types.OptionElement{}
			Option.Name = option.Name
			Options = append(Options, Option)
		}

		Field := types.FieldElement{}
		Field.Name = NormalField.Name
		Field.Type = NormalField.Type
		Field.Documentation = documentation
		Field.Optional = NormalField.Optional
		Field.Repeated = NormalField.Repeated
		Field.Required = NormalField.Required
		Field.Options = Options
		MassFields = append(MassFields, Field)

	}
	Message1.Fields = MassFields

	mapMessages[Message1.Name] = &Message1
}

// handleEnums - обрабатывает 1 enum
func handleEnum(e *proto.Enum) {
	var err error

	documentation := ""
	if e.Comment != nil {
		documentation = e.Comment.Message()
	}

	Enum1 := types.EnumElement{}
	Enum1.Name = e.Name
	Enum1.Documentation = documentation

	MassConstants := make([]types.EnumConstantElement, 0)

	// цикл по полям message
	for _, constant1 := range e.Elements {
		//each.Accept(lister)
		//fmt.Println(constant1)
		EnumField, ok := constant1.(*proto.EnumField)
		if ok == false {
			err = fmt.Errorf("constant1.(*proto.EnumField) error")
			log.Panic(err)
		}

		documentation := ""
		if EnumField.Comment != nil {
			documentation = EnumField.Comment.Message()
		}
		if documentation == "" && EnumField.InlineComment != nil {
			documentation = EnumField.InlineComment.Message()
		}

		Field := types.EnumConstantElement{}
		Field.Name = EnumField.Name
		Field.Documentation = documentation
		Field.ID = EnumField.Integer
		MassConstants = append(MassConstants, Field)

	}
	Enum1.EnumConstants = MassConstants

	mapEnums[Enum1.Name] = &Enum1
}
