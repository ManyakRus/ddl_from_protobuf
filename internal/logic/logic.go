package logic

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/ddl"
	"github.com/ManyakRus/ddl_from_protobuf/internal/types"
	"github.com/ManyakRus/ddl_from_protobuf/pkg/protobuf"
	"github.com/ManyakRus/starter/log"
	"github.com/ManyakRus/starter/micro"
)

// StartAll - запускает всю логику приложения
func StartAll(Settings *config.SettingsINI) {
	//пропарсим все .proto
	dir := micro.ProgramDir()
	Proto, err := protobuf.FindProtobufAll(dir + config.Settings.PROTOBUF_DIRECTORY)
	if err != nil {
		log.Errorln(err)
		return
	}

	//
	FillTypeSQL(Settings, &Proto)

	//
	ddl.StartAll(Settings, Proto)
}

// FillTypeSQL - заполняет типы SQL в структуре Proto.MapMessages.Fields
func FillTypeSQL(Settings *config.SettingsINI, Proto *types.ProtoAll) {

	for _, message1 := range Proto.MapMessages {
		for _, field1 := range message1.Fields {
			Mapping1, ok := Settings.MapSQLTypes[field1.Type]
			if ok == false {
				continue
			}
			field1.TypeSQL = Mapping1.SQLType
		}
	}
}
