import os
import re
from pytube import YouTube


def limpiarNombre(nombre):
    # Eliminar caracteres no válidos para nombres de archivo
    nombre_limpio = re.sub(r'[^\w\s.-]', '', nombre)
    return nombre_limpio

def listarResoluciones(yt):
    streams = yt.streams.filter(file_extension='mp4')
    resoluciones = set()

    for stream in streams:
        if stream.resolution:
            resoluciones.add(stream.resolution)
    
    if '1080p' in resoluciones:
        resoluciones.add('1080p')
    
    resoluciones = list(resoluciones)
    resoluciones.sort(key=lambda x: (int(''.join(filter(str.isdigit, x))), '60' in x), reverse=True)
    return resoluciones

def descargarVideo(url, resolucion):
    try:
        yt = YouTube(url)
        titulo_limpio = limpiarNombre(yt.title)

        video_stream = yt.streams.filter(res=resolucion, file_extension='mp4', type='video').first()
        audio_stream = yt.streams.filter(only_audio=True, file_extension='mp4').order_by('abr').desc().first()

        if video_stream and audio_stream:
            video_path = video_stream.download(output_path="/home/marcosgatica/Vídeos", filename=f"{titulo_limpio}_video")
            audio_path = audio_stream.download(output_path="/home/marcosgatica/Vídeos", filename=f"{titulo_limpio}_audio")

            output_path = f"/home/marcosgatica/Vídeos/{titulo_limpio}_{resolucion}.mp4"

            os.system(f"ffmpeg -i \"{video_path}\" -i \"{audio_path}\" -c copy \"{output_path}\"")

            os.remove(video_path)
            os.remove(audio_path)

            print(f"Video descargado: \"{yt.title}\" en {resolucion} con audio.")
        else:
            print(f"No se encontró un video en {resolucion} para \"{yt.title}\".")

    except Exception as e:
        print(f"Error al descargar el video: {str(e)}")

if __name__ == "__main__":
    url = input("Link de Youtube: ")
    yt = YouTube(url)
    resoluciones = listarResoluciones(yt)

    print("Resoluciones disponibles:")
    for i, res in enumerate(resoluciones):
        print(f"{i + 1}. {res}")

    seleccion = int(input("Selecciona la resolución deseada (número): ")) - 1

    if 0 <= seleccion < len(resoluciones):
        resolucion_elegida = resoluciones[seleccion]
        descargarVideo(url, resolucion_elegida)
    else:
        print("Selección no válida.")

