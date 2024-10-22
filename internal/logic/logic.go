package logic

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/ddl"
	"github.com/ManyakRus/ddl_from_protobuf/internal/protobuf"
	"github.com/ManyakRus/starter/log"
)

func StartAll() {
	//пропарсим все .proto
	MassProto, err := protobuf.FindProtobufAll(config.Settings.DIRECTORY_PROTOBUF)
	if err != nil {
		log.Errorln(err)
		return
	}

	//
	ddl.StartAll(MassProto)
}
