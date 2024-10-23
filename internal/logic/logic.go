package logic

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/ddl"
	"github.com/ManyakRus/ddl_from_protobuf/internal/protobuf"
	"github.com/ManyakRus/starter/log"
)

// StartAll - запускает всю логику приложения
func StartAll(Settings *config.SettingsINI) {
	//пропарсим все .proto
	MassProto, err := protobuf.FindProtobufAll(config.Settings.PROTOBUF_DIRECTORY)
	if err != nil {
		log.Errorln(err)
		return
	}

	//
	ddl.StartAll(Settings, MassProto)
}
