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

	dir := micro.ProgramDir()
	DirReady := dir + Settings.CONVERT_FOLDER_NAME
	TableName := Table1.NameGo
	TableNameSQL := Table1.NameSQL

	DirReadyEntity := DirReady + micro.SeparatorFile() + TableNameSQL
	FilenameReady := DirReadyEntity + micro.SeparatorFile() + TableNameSQL + config.Settings.SUFFIX_CONVERT + ".go"

	//создадим папку готовых файлов
	folders.CreateFolder(DirReadyEntity)

	//
	ProtoURL := Settings.REPOSITORY_PROTO_URL
	ProtoName := micro.LastWord(ProtoURL)
	ProtoNameMessageName := ProtoName + "." + TableName

	//
	Text := `package ` + TableNameSQL + `

import (
	proto "` + ProtoURL + `"
)
`

	//// ConvertToProtobuf - создаёт модель protobuf из модели crud
	//func (m *` + TableName + `) ConvertToProtobuf() ` + ProtoNameMessageName + ` {
	//	Otvet := ` + ProtoNameMessageName + `{}
	//`
	//
	//	//каждое поле
	//	MassColumns := micro.MassFrom_Map(Table1.MapColumns)
	//	for _, Column1 := range MassColumns {
	//		Text1 := TextConvertToProtobufField1(Settings, MapTables, Table1, Column1)
	//		Text = Text + Text1
	//	}
	//
	//	//
	//	Text = Text + "\n\treturn Otvet\n}\n"

	Text = Text + `
// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *` + TableName + `) ConvertFromProtobuf(i ` + ProtoNameMessageName + `)  {
`

	//каждое поле
	MassColumns := micro.MassFrom_Map(Table1.MapColumns)
	for _, Column1 := range MassColumns {
		Text1 := TextConvertFromProtobufField1(Settings, MapTables, Table1, Column1)
		Text = Text + Text1
	}

	//
	Text = Text + "\n\treturn\n}\n"

	Text = create_files.CheckAndAdd_ImportTimestamp_FromText(Text)
	Text = create_files.CheckAndAdd_ImportMicro(Text)

	//запись файла
	err = os.WriteFile(FilenameReady, []byte(Text), config.Settings.FILE_PERMISSIONS)

	return err
}

// TextConvertFromProtobufField1 - возвращает текст для 1 поля
func TextConvertFromProtobufField1(Settings *config.SettingsINI, MapTables map[string]*types.Table, Table1 *types.Table, Column1 *types.Column) string {
	Otvet := ""

	IsProtobufType := create_files.IsProtobufType(Settings, Column1.ProtoType)
	NameGoFromSQL := create_files.NameGo_from_NameSQL(Column1.SQLName)
	//ProtoName := create_files.Convert_ProtoName_to_GRPCName(Column1.ProtoName)
	ProtoName := create_files.Convert_ProtoName_to_GRPCName(Column1.ProtoName)
	//ProtoForeignTableName := Column1.ProtoForeignTableName
	ProtoForeignColumnName := create_files.Convert_ProtoName_to_GRPCName(Column1.ProtoForeignColumnName)
	//ProtoForeignColumnType := Column1.ProtoForeignColumnType
	TypeGoFromSQL := create_files.Convert_TypeSQL_to_TypeGo(Settings, Column1.SQLType)
	ProtoType := Column1.ProtoType

	//простой случай без преобразованиея типа
	if IsProtobufType == true && ProtoType == TypeGoFromSQL {
		Otvet = Otvet + "\tm." + NameGoFromSQL + " = i." + ProtoName + "\n"
		return Otvet
	}

	//случай с преобразованием типа
	if IsProtobufType == true && ProtoType != TypeGoFromSQL {
		TextVariable, GolangCode := create_files.Convert_ProtobufVariableToGolangVariable(Settings, Column1, "i.", ProtoName)
		if GolangCode != "" {
			Otvet = Otvet + GolangCode
		}
		Otvet = Otvet + "\tm." + NameGoFromSQL + " = " + TextVariable + "\n"
		return Otvet
	}

	//случай с алиасом
	if IsProtobufType == false && Column1.IsObject == false {
		if Column1.ProtoForeignColumnType != TypeGoFromSQL {
			Otvet = Otvet + "\tm." + NameGoFromSQL + " = " + TypeGoFromSQL + "(i." + ProtoName + ")\n"
		} else {
			Otvet = Otvet + "\tm." + NameGoFromSQL + " = i." + ProtoName + "\n"
		}
		return Otvet
	}

	//enum
	if Column1.IsEnum == true {
		Otvet = Otvet + "\tm." + NameGoFromSQL + " = int64(i." + ProtoName + "." + ProtoForeignColumnName + ")\n"
		return Otvet
	}

	//случай с объектами, структурами
	if IsProtobufType == false && Column1.IsObject == true {
		TypeGo := create_files.Convert_TypeSQL_to_TypeGo(Settings, Column1.SQLType)
		DefaultValue := create_files.FindText_DefaultValue(TypeGo)
		Otvet = Otvet + "\n\tif i." + ProtoName + " != nil {\n"
		Otvet = Otvet + "\t\tm." + NameGoFromSQL + " = i." + ProtoName + "." + ProtoForeignColumnName + "\n"
		Otvet = Otvet + "\t} else {\n"
		Otvet = Otvet + "\t\tm." + NameGoFromSQL + " = " + DefaultValue + "\n"
		Otvet = Otvet + "\t}\n\n"
	}

	return Otvet
}

//// TextConvertToProtobufField1 - возвращает текст для 1 поля
//func TextConvertToProtobufField1(Settings *config.SettingsINI, MapTables map[string]*types.Table, Table1 *types.Table, Column1 *types.Column) string {
//	Otvet := ""
//
//	IsProtobufType := create_files.IsProtobufType(Settings, Column1.ProtoType)
//	NameGo := create_files.NameGo_from_NameSQL(Column1.SQLName)
//	TypeGo := create_files.Convert_TypeSQL_to_TypeGo(Settings, Column1.SQLType)
//	ProtoName := Column1.ProtoName
//	ProtoForeignTableName := Column1.ProtoForeignTableName
//
//	//простой случай и случай с преобразованием типа
//	if IsProtobufType == true && Column1.ProtoForeignTableName == "" {
//		TextVariable := create_files.Convert_GolangVariableToProtobufVariableType(Settings, Column1, "m.", TypeGo)
//		Otvet = Otvet + "\tOtvet." + ProtoName + " = " + TextVariable + "\n"
//		return Otvet
//	}
//
//	//случай с алиасом
//	if IsProtobufType == false && Column1.ProtoForeignTableName == "" {
//		TextVariable := Column1.ProtoForeignColumnType + "(m." + NameGo + ")"
//		Otvet = Otvet + "\tOtvet." + ProtoName + " = " + TextVariable + "\n"
//		return Otvet
//	}
//
//	//случай с объектами, структурами
//
//	//создаём объект
//	IsFirst := FindIsFirstForeignName(Settings, Table1, Column1)
//	if IsFirst == true {
//		TextProto := config.Settings.REPOSITORY_PROTO_URL
//		TextProto = micro.LastWord(TextProto)
//		Otvet = Otvet + "\n\t" + ProtoForeignTableName + " := &" + TextProto + "." + ProtoForeignTableName + "{}\n"
//	}
//
//	//заполним ИД
//	TableF, ok := MapTables[Column1.ProtoForeignTableName]
//	if ok == false {
//		log.Panic("message: ", Table1.ProtoName, ", field: ", Column1.ProtoName, ", not found table: ", Column1.SQLName)
//	}
//	ColumnPKF := create_files.Find_ColumnPK(TableF)
//	if ColumnPKF == nil {
//		log.Panic("message: ", Table1.ProtoName, ", field: ", Column1.ProtoName, ", not found PK")
//	}
//	NameGoF := create_files.NameGo_from_NameSQL(ColumnPKF.SQLName)
//	Otvet = Otvet + "\tOtvet." + ColumnPKF.ProtoName + " = " + "m." + NameGoF + "\n"
//
//	//присваиваем объект
//	Otvet = Otvet + "\tOtvet." + ProtoForeignTableName + " = " + ProtoForeignTableName + "\n"
//
//	return Otvet
//}

// FindIsFirstForeignName - возвращает true, если эта колонка первая по порядку с таким же ProtoForeignTableName
func FindIsFirstForeignName(Settings *config.SettingsINI, Table1 *types.Table, Column1 *types.Column) bool {
	Otvet := false

	MassColumns := micro.MassFrom_Map(Table1.MapColumns)
	for _, ColumnMass1 := range MassColumns {
		if Column1.ProtoForeignTableName == ColumnMass1.ProtoForeignTableName {
			if Column1 == ColumnMass1 {
				Otvet = true
				return Otvet
			}
			break
		}
	}

	return Otvet
}
