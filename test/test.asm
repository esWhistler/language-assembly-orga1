# Vamos a usar los siguientes registros para guardar:
# R0 –> Dirección del comienzo del vector.
# R1 –> Cantidad de ceros que voy encontrando en el vector.
# R2 –> Tamaño del vector a recorrer.
main:   MOV R0, VECTOR # R0 = dirección donde comienza el vector
        MOV R1, 0x0000 # R1 inicializado en 0
        MOV R2, [SIZE] # R2 = tamaño del vector.
# Chequeo si el elemento del vector (apuntado por R0) es 0.
ciclo:  CMP [R0], 0x0000
        JNE seguir # Salto a la etiqueta seguir si el elemento no era cero.
        ADD R1, 0x0001 # Encontré un cero.
seguir: ADD R0, 0x0001 # Avanzo una posición del vector.
        SUB R2, 0x0001 # Decremento tamaño del vector (un elemento menos por recorrer).
        JNE ciclo # Si quedan elementos por recorrer retoma el ciclo
        MOV CEROS, R1 # Terminé de recorrer el vector y almaceno el resultado

main: MOV R0, 0x0001
			ADD R0, [inc]
			JMP main
inc:	DW 0x0002
