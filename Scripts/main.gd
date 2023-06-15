extends Control


# INPUTS
onready var input_salary = get_node( '%InputSalary' )
onready var input_dias = get_node( '%InputDias' )
onready var input_extra = get_node( '%InputExtra' )

# BUTTONS
onready var button_calculate = get_node( '%ButtonCalculate' )

# LABELS
onready var lbl_salario_hora = get_node( '%LabelHora' )
onready var lbl_salario_extra = get_node( '%LabelHoraExtra' )
onready var lbl_total_semanal = get_node( '%LabelSemanal' )


# FUNCIONES BASE
func _ready() -> void:
	button_calculate.connect( "pressed", self, "_calculate_salary" )
	input_salary.get_line_edit().connect("focus_entered", self, "select_all_text", [input_salary.get_line_edit()])
	input_dias.get_line_edit().connect("focus_entered", self, "select_all_text", [input_dias.get_line_edit()])
	input_extra.get_line_edit().connect("focus_entered", self, "select_all_text", [input_extra.get_line_edit()])

#FUNCIONES PERSONALES
# TODO: Hacer que cuando pase de 9 horas cuenta el triple
func _calculate_salary() -> void:
	var salario:Dictionary = {
		'semanal':		0,
		'hora':			0,
		'extra':		0,
	}

	salario.semanal			= input_salary.value
	salario.hora			= salario.semanal / 48
	salario.extra			= salario.hora * 2
	
	var salario_total		= salario.semanal + ( salario.extra * input_dias.value )
	
	lbl_salario_hora.text	= str( salario.hora )
	lbl_salario_extra.text	= str( salario.extra )
	lbl_total_semanal.text	= str( salario_total )

func select_all_text( line_node:LineEdit ) -> void:
	yield( get_tree().create_timer(0.05), "timeout" )
	line_node.select_all()
