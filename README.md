# WatchDog-CMD
## Piccolo script in CMD, per monitorare l'esecuzione di un programma e in caso di necessità avviarlo/riavviarlo.

### Variabili

Secondi per controllo watchdog

```bash
timewatch=int(sec)
```

Secondi ritardo avvio

```bash
timestart=int(sec)
```

Nome processo

```bash
process="myProgram.exe"
```

Percorso completo programma

```bash
myPath="C:\my\path\myProgram.exe"
```

Riavvio del programma in caso di blocco

```bash
kill=[s|n]
```

### Versione con parametri esterni

Sinstassi corretta del comando:

```bash
WatchDog-CMD_Param.bat <timewatch> <timestart> <"process"> <"myPath"> <kill>
```

Esempio:

```bash
WatchDog-CMD_Param.bat 5 60 "notepad.exe" "C:\Windows\System32\notepad.exe" s
```
