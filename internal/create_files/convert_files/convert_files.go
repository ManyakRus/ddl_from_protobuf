package convert_files

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/create_files"
	"github.com/ManyakRus/ddl_from_protobuf/internal/folders"
	"github.com/ManyakRus/ddl_from_protobuf/internal/types"
	"github.com/ManyakRus/starter/log"
	"github.com/ManyakRus/starter/micro"
)

// CreateFiles_All - создает все файлы convert
func CreateFiles_All(Settings *config.SettingsINI, Proto *types.ProtoAll) {

	for _, message1 := range Proto.MapMessages {
		err := CreateFiles_Message1(Settings, message1)
		if err != nil {
			log.Errorln(err)
			return
		}
	}
}

func CreateFiles_Message1(Settings *config.SettingsINI, Message1 *types.MessageElement) error {
	var err error

	dir := micro.ProgramDir_bin()
	DirReady := dir + Settings.CONFIG_DIRECTORY_NAME + micro.SeparatorFile() + Settings.CONVERT_FOLDER_NAME
	MessageName := Message1.Name
	MessageNameCamelCase := create_files.CamelCase(MessageName)

	Filename := DirReady + micro.SeparatorFile() + MessageNameCamelCase

	//создадим папку готовых файлов
	folders.CreateFolder(DirReady)

	//
	ProtoURL := Settings.REPOSITORY_PROTO_URL
	ProtoName := micro.LastWord(ProtoURL)
	ProtoNameMessageName := ProtoName + "." + MessageName

	//
	Text := `package ` + MessageNameCamelCase + `

import (
	"` + ProtoURL + `"
)

// ConvertToProtobuf - создаёт модель protobuf из модели crud
func (m *` + MessageName + `) ConvertToProtobuf() ` + ProtoNameMessageName + ` {
	Otvet := ` + ProtoNameMessageName + `{}

`

	//каждое поле
	for _, field1 := range Message1.Fields {
		Text1 := TextConvertToProtobufField1(Settings, field1)
		Text = Text + Text1
	}

	return err
}

// TextConvertToProtobufField1 - возвращает текст для 1 поля
func TextConvertToProtobufField1(Settings *config.SettingsINI, Field1 *types.FieldElement) string {
	Otvet := ""

	//простой случай
	FieldNameGo := Field1.NameGo
	Otvet = Otvet + "\tOtvet." + FieldNameGo + " = m." + Field1.Name + "\n"

	//

	return Otvet
}
