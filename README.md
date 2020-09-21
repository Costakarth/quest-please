# Quest, Please

https://costakarth.github.io/quest-please/

In questo documento verrà descritto il gameplay della entry per la Gameloop Gamejam #01: **Quest, Please!**
La proposta è un gioco simulativo in cui il giocatore, nei panni di un quest giver di un qualsiasi RPG, dovrà analizzare le richieste di completamento delle missioni, controllando la validità degli oggetti consegnati.
 
## Game Design

**Quest, Please!** è un gioco di simulazione in cui il giocatore entrerà nei panni di un quest giver alle prese con il suo lavoro quotidiano di buon NPC.  

Il MVP per questo progetto sarà un gioco giocabile tramite browser e delle durata complessiva di una decina di minuti.

Sarà ambientato, prevalentemente, in una schermata unica, divisa in 4 parti.

![Area di Gioco](https://i.imgur.com/CCm7G7a.png)

Il *ritratto dell'eroe* servirà per il riconoscimento dei tratti somatici e della classe di appartenenza dell'eroe. Questi tratti sono da considerare per quanto riguarda le possibili limitazioni della giornata.

Nell'*area di scaricamento miniature oggetti* l'eroe provvederà a fornire gli oggetti a sua disposizione per l'eventuale completamente della missione. In quest'area l'oggetto non è facilmente riconoscibile e sarà rappresentato da una generica miniatura rappresentante l'oggetto in questione.

Nell'*area delle regole* saranno appese la lista di missioni disponibili per la giornata e le limitazioni ad esse relative. Ad esempio: "Nessun driver può completare la missione 'Porta 5 floppy dei dati della corporazione INTEGRI '". 

Nell'*area di manipolazione oggetti* sarà possibile avere una versione più dettagliata dell'oggetto e sarà possibile girarla ed analizzarla visivamente per cercare eventuali problemi (esempio: un pezzo di pelle richiesta è strappata). Inoltre in quest'area sarà presente anche il cestino per gettare gli oggetti consegnati dagli eroi, due pulsanti per accettare o rifiutare la missione e dei contenitori dove prendere le ricompense per la missione.

## Classi
 1. Netrunner (hacker)
        -  
 3. Dealer (mercante del mercato nero)
 4. Corporate director (direttore di corporazione)
 5. Fixer (medico/meccanico)
 6. Enhancer (scienziato)
 7. Driver (autista)

## Oggetti

Gli oggetti sono i seguenti:

 - **Tonkatsu Memory Chip**
		 - oggetto: memory chip
		 - errori: numero, stato e sigla parte inferiore (
 - **CyanHaze Cigarettes**
		 - oggetto: pacchetto sigarette
		 - errori: numero, stato, sigarette nel pacchetto
 - **MindBooster Drug**
		 - oggetto: siringa
		 - errori: numero, stato, colore
 - **OldPremium Barley Whiskey**
		 - oggetto: bottiglia di alcolici
		 - errori: numero, stato, etichetta, peso
 - **FloppyDisk 512 Exabyte**
		 - oggetto: floppy disk
		 - errori: numero, stato, colore, sigla

## Missioni

Le missioni richiederanno un numero variabile di oggetti, inizialmente di una sola tipologia, successivamente anche diverse tipologie contemporaneamente.

Sarà possibile controllare la validità degli oggetti utilizzando degli appositi strumenti, come lente d'ingrandimento, filtro colore, bilancia, strumenti vari di controllo, ...
Se gli oggetti di missione sono corretti, si accetta la consegna, altrimenti si deve rifiutare.

[TDB: cosa succede se sbagli o fai giusto. Soldi? Gloria? BOHHH ]


