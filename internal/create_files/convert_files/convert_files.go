package convert_files

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/create_files"
	"github.com/ManyakRus/ddl_from_protobuf/internal/folders"
	"github.com/ManyakRus/ddl_from_protobuf/internal/types"
	"github.com/ManyakRus/starter/log"
	"github.com/ManyakRus/starter/micro"
	"os"
)

// CreateFiles_All - создает все файлы convert
func CreateFiles_All(Settings *config.SettingsINI, MapTables map[string]*types.Table) {

	MassTables := micro.MassFrom_Map(MapTables)
	for _, Table1 := range MassTables {
		err := CreateFiles_Message1(Settings, MapTables, Table1)
		if err != nil {
			log.Errorln(err)
			return
		}
	}
}

func CreateFiles_Message1(Settings *config.SettingsINI, MapTables map[string]*types.Table, Table1 *types.Table) error {
	var err error

	if Table1.IsEnum == true {
		return err
	}

	dir := micro.ProgramDir_bin()
	DirReady := dir + Settings.CONFIG_DIRECTORY_NAME + micro.SeparatorFile() + Settings.CONVERT_FOLDER_NAME
	TableName := Table1.NameGo
	TableNameSQL := create_files.CamelCase(TableName)

	FilenameReady := DirReady + micro.SeparatorFile() + TableNameSQL

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
		Text1 := TextConvertToProtobufField1(Settings, MapTables, Table1, Column1)
		Text = Text + Text1
	}

	//
	Text = Text + "\n\treturn Otvet\n}\n"

	Text = create_files.CheckAndAdd_ImportTimestamp_FromText(Text)

	//запись файла
	err = os.WriteFile(FilenameReady, []byte(Text), config.Settings.FILE_PERMISSIONS)

	return err
}

// TextConvertToProtobufField1 - возвращает текст для 1 поля
func TextConvertToProtobufField1(Settings *config.SettingsINI, MapTables map[string]*types.Table, Table1 *types.Table, Column1 *types.Column) string {
	Otvet := ""

	IsProtobufType := create_files.IsProtobufType(Settings, Column1.TypeProtobuf)
	NameGo := create_files.NameGo_from_NameSQL(Column1.NameSQL)
	TypeGo := create_files.Convert_TypeSQL_to_TypeGo(Settings, Column1.TypeSQL)
	NameProtobuf := Column1.NameProtobuf
	NameForeignProtobuf := Column1.NameForeignProtobuf

	//простой случай и случай с преобразованием типа
	if IsProtobufType == true && Column1.NameForeignProtobuf == "" {
		TextVariable := create_files.Convert_GolangVariableToProtobufVariableType(Settings, Column1, "m.", TypeGo)
		Otvet = Otvet + "\tOtvet." + NameProtobuf + " = " + TextVariable + "\n"
		return Otvet
	}

	//случай с алиасом
	if IsProtobufType == false && Column1.NameForeignProtobuf == "" {
		TextVariable := Column1.TypeForeignProtobuf + "(m." + NameGo + ")"
		Otvet = Otvet + "\tOtvet." + NameProtobuf + " = " + TextVariable + "\n"
		return Otvet
	}

	//случай с объектами, структурами

	//создаём объект
	IsFirst := FindIsFirstForeignName(Settings, Table1, Column1)
	if IsFirst == true {
		TextProto := config.Settings.REPOSITORY_PROTO_URL
		TextProto = micro.LastWord(TextProto)
		Otvet = Otvet + "\n\t" + NameForeignProtobuf + " := &" + TextProto + "." + NameForeignProtobuf + "{}\n"
	}

	//заполним ИД
	TableF, ok := MapTables[Column1.NameForeignProtobuf]
	if ok == false {
		log.Panic("message: ", Table1.NameProtobuf, ", field: ", Column1.NameProtobuf, ", not found table: ", Column1.NameSQL)
	}
	ColumnPKF := create_files.Find_ColumnPK(TableF)
	if ColumnPKF == nil {
		log.Panic("message: ", Table1.NameProtobuf, ", field: ", Column1.NameProtobuf, ", not found PK")
	}
	NameGoF := create_files.NameGo_from_NameSQL(ColumnPKF.NameSQL)
	Otvet = Otvet + "\tOtvet." + ColumnPKF.NameProtobuf + " = " + "m." + NameGoF + "\n"

	//присваиваем объект
	Otvet = Otvet + "\tOtvet." + NameForeignProtobuf + " = " + NameForeignProtobuf + "\n"

	return Otvet
}

// FindIsFirstForeignName - возвращает true, если эта колонка первая по порядку с таким же NameForeignProtobuf
func FindIsFirstForeignName(Settings *config.SettingsINI, Table1 *types.Table, Column1 *types.Column) bool {
	Otvet := false

	MassColumns := micro.MassFrom_Map(Table1.MapColumns)
	for _, ColumnMass1 := range MassColumns {
		if Column1.NameForeignProtobuf == ColumnMass1.NameForeignProtobuf {
			if Column1 == ColumnMass1 {
				Otvet = true
				return Otvet
			}
			break
		}
	}

	return Otvet
}
