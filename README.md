The ddl_from_protobuf application is designed to create a DDL .sql file from protobuf .proto files
A text file is created with SQL query text for creating tables, etc.

Can create:
- tables
- columns
- primary key
- constraints
- indexes

In .proto files, it finds all messages and enums, and creates DDL for them

For enum:
A table is created with the fields "id" and "name", primary key and index "id"
all values ​​are filled in the rows (insert)

For message:
Only messages that have a primary key are taken, i.e. a column with the name: "primary_key", "id", "uid"
A table with the name from messaage is created.
All columns that are in message are created, including:
- simple types
- references to enum tables
- references to message tables that have a primary key
- for references to message tables that do not have a primary key, many separate columns are created that are in the related table.
For columns of links to other tables, the suffix "_id" is added
Table and column names for SQL are formatted in the snake_case standard, in lowercase letters (since uppercase letters must be written in quotes)

Installation procedure:
1. Compile this repository
>make build
a ddl_from_protobuf file will appear in the bin folder

2. Put protobuf .proto files in the bin/proto folder

3. Fill in the settings in the settings.txt (or .env) file
You can leave them blank, the default settings will be used

4. Run
>ddl_from_protobuf
A new ddl.sql file will appear in the bin/proto folder

Settings:
primary_key_names.json - you can change the list of field names for the primary key in the file
database_types.json - a table of type correspondences in protobuf and SQL
columns_every_table.sql - SQL test for adding to every table (empty)

Source code in Golang.
Tested on Linux Ubuntu
Readme from 10/31/2024

Made by Aleksandr Nikitin
https://github.com/ManyakRus/ddl_from_protobuf
