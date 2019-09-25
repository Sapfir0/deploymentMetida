import random


tables = {
    'table1': [{'column11':str}, {'column21':int}],
    'table2': [{'column12':float}, {'column22':str}] 
}
# table: [ {column: type} , {column2: type}]


insertUpdateData = [1, "foo", 2.4] # можно сделать тупо проверку по типу

for array in tables.values():
    array.append("*")

def abstractComand(command, table='', selectStatement='') -> str:
    stringCommand = command.value[0]
    if not table:
        table = random.choice(list(tables.keys()))
        operationsColumn = random.choice(tables[table]) # пока допустим что только один оператор
    if operationsColumn != "*":
        operationsColumn = list(operationsColumn.keys())[0] # выбираем название столбца
    if command == sql.DELETE:
        return f"{stringCommand} from {table}{selectStatement};"
    elif command == sql.INSERT:
        #values = 
        return f"{stringCommand} INTO {table} VALUES ();"
    elif command == sql.SELECT:
        return f"{stringCommand} {operationsColumn} from {table}{selectStatement};"
    elif command == sql.UPDATE:
        return f"{stringCommand} {table} SET {{ }};"



def updateTemplate():
    return abstractComand(sql.UPDATE)


def deleteTemplate():
    return abstractComand(sql.DELETE)


def insertTemplate():
    return abstractComand(sql.INSERT)


def selectTemplate():
    return abstractComand(sql.SELECT)

import enum
class sql(enum.Enum):
    SELECT = "SELECT",
    UPDATE = "UPDATE",
    DELETE = "DELETE",
    INSERT = "INSERT",
    ZATICHKA = ""

funarray = [updateTemplate(), selectTemplate(), deleteTemplate(), insertTemplate()]
print(random.choice(funarray))


def generateWhereStatements():
    
        
    return f"WHERE {}"