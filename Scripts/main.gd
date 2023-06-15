extends Control

onready var input_salary = get_node( '%InputSalary' )
onready var input_dias = get_node( '%InputDias' )
onready var input_extra = get_node( '%InputExtra' )
onready var button_calculate = get_node( '%ButtonCalculate' )
onready var salario_extra = get_node( '%LabelResultExtra' )
onready var label_result = get_node( '%LabelResultTotal' )


# FUNCIONES BASE
func _ready() -> void:
	button_calculate.connect( "pressed", self, "_calculate_salary" )
	input_salary.get_line_edit().connect("focus_entered", self, "select_all_text", [input_salary.get_line_edit()])
	input_dias.get_line_edit().connect("focus_entered", self, "select_all_text", [input_dias.get_line_edit()])
	input_extra.get_line_edit().connect("focus_entered", self, "select_all_text", [input_extra.get_line_edit()])

#FUNCIONES PERSONALES
func _calculate_salary() -> void:
	var salario:Dictionary = {
		'semanal':		0,
		'extra':		0,
		'extra_total':	0,
	}

	salario.semanal			= input_salary.value
	salario.extra			= salario.semanal / 48
	salario.extra_total		= salario.extra * input_dias.value

	salario_extra.text	= str( salario.extra )
	label_result.text 	= str( salario.semanal + salario.extra_total )

func select_all_text( line_node:LineEdit ) -> void:
	yield( get_tree().create_timer(0.1), "timeout" )
	line_node.select_all()
