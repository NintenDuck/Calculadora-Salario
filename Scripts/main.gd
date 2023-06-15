extends Control

onready var input_salary = get_node( '%InputSalary' )
onready var input_dias = get_node( '%InputDias' )
onready var input_horas = get_node( '%InputHoras' )
onready var input_extra = get_node( '%InputExtra' )
onready var button_calculate = get_node( '%ButtonCalculate' )
onready var label_total_diario = get_node( '%LabelResultDiario' )
onready var label_total_hora = get_node( '%LabelResultHora' )
onready var label_total_extra = get_node( '%LabelResultExtra' )


# FUNCIONES BASE
func _ready() -> void:
	button_calculate.connect( "pressed", self, "_calculate_salary" )
	input_salary.get_line_edit().connect("focus_entered", self, "foo", [input_salary.get_line_edit()])
	input_dias.get_line_edit().connect("focus_entered", self, "foo", [input_dias.get_line_edit()])
	input_horas.get_line_edit().connect("focus_entered", self, "foo", [input_horas.get_line_edit()])
	input_extra.get_line_edit().connect("focus_entered", self, "foo", [input_extra.get_line_edit()])

#FUNCIONES PERSONALES
func _calculate_salary() -> void:
	var salario:Dictionary = {
		'semanal':		0,
		'diario':		0,
		'hora':			0,
		'extra':		0,
	}

	salario.semanal			= input_salary.value
	salario.diario			= salario.semanal / input_dias.value
	salario.hora			= salario.diario / input_horas.value
	salario.extra			= salario.hora *  input_extra.value

	label_total_diario.text	= str( salario.diario )
	label_total_hora.text	= str( salario.hora )
	label_total_extra.text	= str( salario.extra )

func foo( line_node:LineEdit ) -> void:
	yield( get_tree().create_timer(0.1), "timeout" )
	line_node.select_all()
