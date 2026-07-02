extends Node

const SAVE_PATH = "C:/Users/roboz/Documents/dicionario-de-libras/videos/a.ogv"
const  VIDEO_URL = "https://dicionario.ines.gov.br/public/media/palavras/videos/aSm_Prog001.mp4"

func _ready() -> void:
	$HTTPRequest.request_completed.connect(_on_video_downloaded)
	
	$HTTPRequest.download_file = SAVE_PATH
	var error = $HTTPRequest.request(VIDEO_URL)
	if error != OK:
		print("Um erro no https")

func _on_video_downloaded(result: int, response_code: int, _headers: PackedStringArray, _body: PackedByteArray) -> void:
	if result == HTTPRequest.RESULT_SUCCESS and response_code == 200:
		print("Download Completo")
		var stream = VideoStreamTheora.new()
		stream.file = SAVE_PATH
		$VideoStreamPlayer.stream = stream
		$VideoStreamPlayer.play()
	else:
		print("Erro no download")
