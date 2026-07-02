extends Control

var sinais : Array = []

@export var escolha : PackedScene

func _ready() -> void:
	var file = FileAccess.open("dados.txt",FileAccess.READ)
	sinais = str_to_var(file.get_as_text())
	file.close()
	for i in sinais:
		var button = Button.new()
		button.text = i.palavra
		button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		button.name = i.palavra
		%Palavras.add_child(button)

func _on_buscar_pressed() -> void:
	var palavra = %Palavra.text.to_upper()
	if %Numero.text != "":
		for i in %Palavras.get_children():
			i.hide()
		%Palavras.get_node(sinais[int(%Numero.text)].palavra).show()
	for i in %Palavras.get_children():
		if i.name.contains(palavra):
			i.show()
		else: i.hide()



func _on_adicionar_sinal_pressed() -> void:
	$Adicionar.show()
	$Adicionar.position = Vector2(200,50)


func _on_remover_sinal_pressed() -> void:
	var janela = escolha.instantiate()
	janela.position = Vector2(500,50)
	janela.modo = "remover"
	add_child(janela)


func _on_alterar_sinal_pressed() -> void:
	var janela = escolha.instantiate()
	janela.position = Vector2(500,50)
	janela.modo = "alterar"
	add_child(janela)

func update():
	var file = FileAccess.open("dados.txt",FileAccess.READ_WRITE)
	sinais.sort_custom(func(a,b): return a.palavra < b.palavra)
	file.store_line(var_to_str(sinais))
	file.close()
	for child in %Palavras.get_children():
		child.queue_free()
	for i in sinais:
		var button = Button.new()
		button.text = i.palavra
		button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		button.name = i.palavra
		%Palavras.add_child(button)
		button.pressed.connect(info.bind(i))

func info(sig):
	%Assunto.text = sig.assunto
	%Acepcao.text = sig.acepcao
	%Exemplo.text = sig.exemplo
	%Classe.text = sig.classe
	%Exemplo_Libras.text = sig.exemplo_libras
	%Origem.text = sig.origem
