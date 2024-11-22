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
func CreateFiles_All(Settings *config.SettingsINI, MapTables map[string]*types.Table) {

	MassTables := micro.MassFrom_Map(MapTables)
	for _, Table1 := range MassTables {
		err := CreateFiles_Message1(Settings, Table1)
		if err != nil {
			log.Errorln(err)
			return
		}
	}
}

func CreateFiles_Message1(Settings *config.SettingsINI, Table1 *types.Table) error {
	var err error

	dir := micro.ProgramDir_bin()
	DirReady := dir + Settings.CONFIG_DIRECTORY_NAME + micro.SeparatorFile() + Settings.CONVERT_FOLDER_NAME
	TableName := Table1.NameGo
	TableNameSQL := create_files.CamelCase(TableName)

	Filename := DirReady + micro.SeparatorFile() + TableNameSQL

	//создадим папку готовых файлов
	folders.CreateFolder(DirReady)

	//
	ProtoURL := Settings.REPOSITORY_PROTO_URL
	ProtoName := micro.LastWord(ProtoURL)
	ProtoNameMessageName := ProtoName + "." + TableName

	//
	Text := `package ` + TableNameSQL + `

import (
	"` + ProtoURL + `"
)

// ConvertToProtobuf - создаёт модель protobuf из модели crud
func (m *` + TableName + `) ConvertToProtobuf() ` + ProtoNameMessageName + ` {
	Otvet := ` + ProtoNameMessageName + `{}

`

	//каждое поле
	MassColumns := micro.MassFrom_Map(Table1.MapColumns)
	for _, Column1 := range MassColumns {
		Text1 := TextConvertToProtobufField1(Settings, Column1)
		Text = Text + Text1
	}

	return err
}

// TextConvertToProtobufField1 - возвращает текст для 1 поля
func TextConvertToProtobufField1(Settings *config.SettingsINI, Column1 *types.Column) string {
	Otvet := ""

	//простой случай
	NameGo := create_files.NameGo_from_NameSQL(Column1.NameSQL)
	NameProtobuf := Column1.NameProtobuf
	Otvet = Otvet + "\tOtvet." + NameProtobuf + " = m." + NameGo + "\n"

	//

	return Otvet
}
